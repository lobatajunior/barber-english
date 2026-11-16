import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'core/app_theme.dart';
import 'core/app_colors.dart';
import 'providers/auth_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'services/account_service.dart';
import 'services/safe_area_stub.dart'
    if (dart.library.js_interop) 'services/safe_area_web.dart';

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  runApp(const ProviderScope(child: BarberEnglishApp()));
  if (kIsWeb) AccountService.completeGoogleRedirect().then(_showRedirectError);
}

// Error de "Continuar con Google" por redirect: la página se recargó, así que
// el botón ya no existe y el aviso sale como SnackBar.
void _showRedirectError(FirebaseAuthException? e) {
  if (e == null) return;
  final inUse = AccountService.isEmailInUse(e);
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _messengerKey.currentState?.showSnackBar(SnackBar(
      duration: const Duration(seconds: 10),
      content: Text(inUse
          ? 'Ese correo ya tiene cuenta. Tu progreso de invitado no se '
              'pasará a esa cuenta.'
          : AccountService.errorMessage(e)),
      action: inUse
          ? SnackBarAction(
              label: 'Iniciar sesión con esa cuenta',
              onPressed: () => AccountService.signInExistingGoogle()
                  .catchError((_) {}),
            )
          : null,
    ));
  });
}

class BarberEnglishApp extends ConsumerWidget {
  const BarberEnglishApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Barber English',
      scaffoldMessengerKey: _messengerKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      builder: (context, child) => _MobileFrame(child: child!),
      home: authState.when(
        loading: () => const _SplashScreen(),
        error: (_, _) => const LoginScreen(),
        data: (user) => user != null ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}

/// En web, la app se ve como en un móvil: en pantallas anchas todo va en una
/// columna centrada de [_kMaxAppWidth] px con fondo #080808 a los lados; en
/// pantallas estrechas ocupa todo el ancho. Envuelve al Navigator, así que
/// diálogos, SnackBars y overlays quedan dentro de la columna.
/// También pasa a MediaQuery el área segura del navegador (barra de gestos,
/// muesca), que Flutter web no informa, para que SafeArea funcione.
const double _kMaxAppWidth = 480;

class _MobileFrame extends StatelessWidget {
  const _MobileFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return child;
    var mq = MediaQuery.of(context);

    final safe = webSafeAreaInsets();
    if (safe.top > mq.viewPadding.top || safe.bottom > mq.viewPadding.bottom) {
      final viewPadding = mq.viewPadding.copyWith(
        top: safe.top > mq.viewPadding.top ? safe.top : null,
        bottom: safe.bottom > mq.viewPadding.bottom ? safe.bottom : null,
      );
      // Con el teclado abierto, el padding inferior lo cubre el teclado.
      final bottom = viewPadding.bottom - mq.viewInsets.bottom;
      mq = mq.copyWith(
        viewPadding: viewPadding,
        padding: viewPadding.copyWith(bottom: bottom > 0 ? bottom : 0),
      );
    }

    if (mq.size.width <= _kMaxAppWidth) {
      return MediaQuery(data: mq, child: child);
    }
    return ColoredBox(
      color: const Color(0xFF080808),
      child: Center(
        child: ClipRect(
          child: SizedBox(
            width: _kMaxAppWidth,
            // El resto de MediaQuery (teclado, paddings, escala de texto) se
            // conserva; solo el ancho pasa a ser el de la columna.
            child: MediaQuery(
              data: mq.copyWith(size: Size(_kMaxAppWidth, mq.size.height)),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
    );
  }
}
