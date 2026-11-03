import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Registro, vinculación de invitados y perfil (nombre) en users/{uid}.
class AccountService {
  static final _db = FirebaseFirestore.instance;

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
        'too-many-requests' =>
          'Demasiados intentos. Espera un momento e inténtalo de nuevo',
        _ => 'No se pudo completar. Inténtalo de nuevo',
      };
}
