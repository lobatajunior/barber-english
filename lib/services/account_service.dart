import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'standalone_stub.dart' if (dart.library.js_interop) 'standalone_web.dart';

/// Registro, vinculación de invitados y perfil (nombre) en users/{uid}.
class AccountService {
  static final _db = FirebaseFirestore.instance;

  // Cliente web de OAuth (client_type 3 en google-services.json): en Android,
  // google_sign_in lo necesita para devolver el idToken que usa Firebase.
  static const _kGoogleServerClientId =
      '625038868457-aqms8o6vb66l7gacmafeobmb9efvtkh2.apps.googleusercontent.com';

  // Si el popup no puede abrirse, se pasa a redirect.
  static const _popupUnavailable = {
    'popup-blocked',
    'operation-not-supported-in-this-environment',
  };

  static Future<void>? _googleInit;

  /// Credencial de Google cuyo correo ya tiene cuenta (al vincular un
  /// invitado). Sirve para "Iniciar sesión con esa cuenta" sin volver a elegirla.
  static AuthCredential? _pendingGoogleCredential;

  /// Usuarios a los que no hay que preguntar el nombre en esta sesión: los que
  /// acaban de registrarse (su nombre aún puede no haber llegado a Firestore)
  /// y los que respondieron "Ahora no" o "Guardar" en el diálogo.
  static final Set<String> namePromptDone = {};

  /// true mientras se crea o vincula una cuenta: authStateChanges dispara
  /// HomeScreen antes de que se guarde el perfil, y no debe preguntar el nombre.
  static bool registering = false;

  static bool get isGuest =>
      FirebaseAuth.instance.currentUser?.isAnonymous ?? false;

  /// Crea una cuenta nueva con correo y contraseña y guarda su perfil.
  static Future<void> register({
    required String nombre,
    required String apellido,
    required String email,
    required String password,
    required bool marketingOk,
  }) async {
    registering = true;
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = cred.user!.uid;
      namePromptDone.add(uid);
      _saveProfile(uid, nombre, apellido, email, marketingOk);
    } finally {
      registering = false;
    }
  }

  /// Convierte la cuenta anónima actual en una cuenta con correo, conservando
  /// el mismo uid (y con él el XP y las lecciones).
  static Future<void> linkGuest({
    required String nombre,
    required String apellido,
    required String email,
    required String password,
    required bool marketingOk,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseAuthException(code: 'no-current-user');
    }
    registering = true;
    try {
      await user.linkWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
      namePromptDone.add(user.uid);
      _saveProfile(user.uid, nombre, apellido, email, marketingOk);
    } finally {
      registering = false;
    }
  }

  // merge: true para no pisar xp_total, racha_dias, etc. Sin await: el future
  // de Firestore solo se completa con el ack del servidor (offline colgaría).
  static void _saveProfile(String uid, String nombre, String apellido,
      String email, bool marketingOk) {
    _db.collection('users').doc(uid).set({
      'nombre': nombre,
      'apellido': apellido,
      'email': email,
      'marketing_ok': marketingOk,
      if (marketingOk) 'marketing_fecha': FieldValue.serverTimestamp(),
      'creado': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true)).catchError((_) {});
  }

  static void saveName(String uid, String nombre) {
    _db
        .collection('users')
        .doc(uid)
        .set({'nombre': nombre}, SetOptions(merge: true))
        .catchError((_) {});
  }

  /// Google solo está configurado para web y Android.
  static bool get googleSupported =>
      kIsWeb || defaultTargetPlatform == TargetPlatform.android;

  /// Inicia sesión con Google o, si el usuario actual es invitado, vincula
  /// Google a su cuenta (mismo uid, XP y lecciones). Devuelve false si el
  /// usuario canceló o si la página se va a Google por redirect.
  /// Con credential-already-in-use guarda la credencial para
  /// [signInExistingGoogle].
  static Future<bool> continueWithGoogle() async {
    final user = FirebaseAuth.instance.currentUser;
    final guest = user != null && user.isAnonymous ? user : null;
    registering = true;
    try {
      final UserCredential result;
      if (kIsWeb) {
        final provider = GoogleAuthProvider();
        if (isStandaloneWebApp()) {
          await _googleRedirect(provider, guest);
          return false;
        }
        try {
          result = guest != null
              ? await guest.linkWithPopup(provider)
              : await FirebaseAuth.instance.signInWithPopup(provider);
        } on FirebaseAuthException catch (e) {
          if (_isCancel(e)) return false;
          if (!_popupUnavailable.contains(e.code)) rethrow;
          await _googleRedirect(provider, guest);
          return false;
        }
      } else {
        final cred = await _androidGoogleCredential();
        if (cred == null) return false;
        try {
          result = guest != null
              ? await guest.linkWithCredential(cred)
              : await FirebaseAuth.instance.signInWithCredential(cred);
        } on FirebaseAuthException catch (e) {
          if (isEmailInUse(e)) _pendingGoogleCredential = e.credential ?? cred;
          rethrow;
        }
      }
      namePromptDone.add(result.user!.uid);
      unawaited(_saveGoogleProfile(result.user!));
      return true;
    } on FirebaseAuthException catch (e) {
      if (kIsWeb && isEmailInUse(e)) _pendingGoogleCredential = e.credential;
      rethrow;
    } finally {
      registering = false;
    }
  }

  /// Tras credential-already-in-use: deja la cuenta de invitado (su progreso
  /// no pasa) y entra en la cuenta que ya tiene ese correo.
  static Future<void> signInExistingGoogle() async {
    final cred = _pendingGoogleCredential;
    _pendingGoogleCredential = null;
    registering = true;
    try {
      final UserCredential result;
      if (cred != null) {
        result = await FirebaseAuth.instance.signInWithCredential(cred);
      } else if (kIsWeb) {
        result =
            await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
      } else {
        final fresh = await _androidGoogleCredential();
        if (fresh == null) return;
        result = await FirebaseAuth.instance.signInWithCredential(fresh);
      }
      namePromptDone.add(result.user!.uid);
      unawaited(_saveGoogleProfile(result.user!));
    } finally {
      registering = false;
    }
  }

  /// Web: recoge el resultado de un inicio de sesión por redirect al volver a
  /// la app. Devuelve el error, si lo hubo, para mostrarlo.
  static Future<FirebaseAuthException?> completeGoogleRedirect() async {
    registering = true;
    try {
      final r = await FirebaseAuth.instance.getRedirectResult();
      final user = r.user;
      if (user != null && r.additionalUserInfo?.providerId == 'google.com') {
        namePromptDone.add(user.uid);
        unawaited(_saveGoogleProfile(user));
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (isEmailInUse(e)) _pendingGoogleCredential = e.credential;
      return _isCancel(e) ? null : e;
    } catch (_) {
      return null;
    } finally {
      registering = false;
    }
  }

  /// Cierra la sesión de Firebase y también la de Google en Android.
  static Future<void> signOut() async {
    if (!kIsWeb && googleSupported) {
      try {
        await _ensureGoogleInit();
        await GoogleSignIn.instance.signOut();
      } catch (_) {}
    }
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> _googleRedirect(
          GoogleAuthProvider provider, User? guest) =>
      guest != null
          ? guest.linkWithRedirect(provider)
          : FirebaseAuth.instance.signInWithRedirect(provider);

  static bool _isCancel(FirebaseAuthException e) =>
      e.code == 'popup-closed-by-user' ||
      e.code == 'cancelled-popup-request' ||
      e.code == 'user-cancelled';

  static Future<void> _ensureGoogleInit() {
    return _googleInit ??= GoogleSignIn.instance
        .initialize(serverClientId: _kGoogleServerClientId)
        .catchError((Object e) {
      _googleInit = null;
      throw e;
    });
  }

  /// Android: elige la cuenta de Google y devuelve la credencial de Firebase,
  /// o null si el usuario canceló.
  static Future<AuthCredential?> _androidGoogleCredential() async {
    await _ensureGoogleInit();
    try {
      final account = await GoogleSignIn.instance.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null) {
        throw const GoogleSignInException(
            code: GoogleSignInExceptionCode.unknownError);
      }
      return GoogleAuthProvider.credential(idToken: idToken);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    }
  }

  // Perfil desde Google: nombre y apellido solo si el documento no tiene
  // nombre; marketing_ok = false solo si el campo no existe. merge: true no
  // pisa XP, racha ni lecciones. Si no se puede leer el documento (sin
  // conexión y sin caché), solo se guardan email y auth_provider.
  static Future<void> _saveGoogleProfile(User user) async {
    final ref = _db.collection('users').doc(user.uid);
    final google = user.providerData
        .where((p) => p.providerId == 'google.com')
        .firstOrNull;
    final email = google?.email ?? user.email;
    final update = <String, dynamic>{
      'email': ?email,
      'auth_provider': 'google',
    };
    try {
      final data = (await ref.get()).data() ?? const <String, dynamic>{};
      final nombreActual = (data['nombre'] as String? ?? '').trim();
      final parts = (google?.displayName ?? user.displayName ?? '')
          .trim()
          .split(RegExp(r'\s+'))
          .where((w) => w.isNotEmpty)
          .toList();
      if (nombreActual.isEmpty && parts.isNotEmpty) {
        update['nombre'] = parts.first;
        update['apellido'] = parts.skip(1).join(' ');
      }
      if (!data.containsKey('marketing_ok')) update['marketing_ok'] = false;
    } catch (_) {}
    ref.set(update, SetOptions(merge: true)).catchError((_) {});
  }

  /// true si el error significa que el correo ya pertenece a otra cuenta.
  static bool isEmailInUse(FirebaseAuthException e) =>
      e.code == 'email-already-in-use' || e.code == 'credential-already-in-use';

  static String errorMessage(FirebaseAuthException e) => switch (e.code) {
        'email-already-in-use' ||
        'credential-already-in-use' =>
          'Ese correo ya tiene cuenta. Inicia sesión',
        'weak-password' => 'La contraseña debe tener al menos 6 caracteres',
        'invalid-email' => 'El correo no es válido',
        'network-request-failed' =>
          'Sin conexión. Revisa tu internet e inténtalo de nuevo',
        'user-not-found' => 'No existe una cuenta con ese correo',
        'wrong-password' ||
        'invalid-credential' =>
          'Correo o contraseña incorrectos',
        'account-exists-with-different-credential' =>
          'Ese correo ya tiene cuenta con contraseña. Inicia sesión con tu '
              'contraseña.',
        'user-disabled' => 'Esta cuenta está desactivada',
        'operation-not-allowed' => 'Este método de acceso no está activado',
        'too-many-requests' =>
          'Demasiados intentos. Espera un momento e inténtalo de nuevo',
        _ => 'No se pudo completar. Inténtalo de nuevo',
      };

  /// Mensaje en español para cualquier error de "Continuar con Google".
  static String googleErrorMessage(Object e) => switch (e) {
        FirebaseAuthException() => errorMessage(e),
        GoogleSignInException() =>
          'No se pudo entrar con Google. Revisa tu conexión e inténtalo de '
              'nuevo',
        _ => 'No se pudo completar. Inténtalo de nuevo',
      };
}
