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
      home: authState.when(
        loading: () => const _SplashScreen(),
        error: (_, _) => const LoginScreen(),
        data: (user) => user != null ? const HomeScreen() : const LoginScreen(),
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
