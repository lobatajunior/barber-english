import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../services/account_service.dart';
import '../widgets/register_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool _isLogin = true;
  bool _isLoading = false;
  bool _showPass = false;
  String _error = '';

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _error = '';
      _isLoading = true;
    });

    if (_passCtrl.text.length < 6) {
      setState(() {
        _error = 'La contraseña debe tener al menos 6 caracteres';
        _isLoading = false;
      });
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passCtrl.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (mounted) setState(() => _error = AccountService.errorMessage(e));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _continueAnonymous() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        setState(() {
          _error = switch (e.code) {
            'operation-not-allowed' =>
              'El acceso de invitado no está habilitado. Crea una cuenta gratuita.',
            'network-request-failed' => AccountService.errorMessage(e),
            _ => 'No se pudo entrar como invitado. Inténtalo de nuevo',
          };
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'No se pudo iniciar sesión de invitado';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 32),

                // — Logo / mascota —
                Image.asset('assets/pose1.png', height: 150),
                const SizedBox(height: 16),

                Text(
                  'BARBER ENGLISH',
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _isLogin
                      ? 'Inicia sesión para continuar'
                      : 'Crea tu cuenta gratuita',
                  style: GoogleFonts.outfit(
                      fontSize: 14, color: Colors.white60),
                ),
                const SizedBox(height: 32),

                if (_isLogin) ..._buildLoginForm() else const RegisterForm(),
                const SizedBox(height: 14),

                // — Toggle login / registro —
                TextButton(
                  onPressed: () => setState(() {
                    _isLogin = !_isLogin;
                    _error = '';
                  }),
                  child: Text(
                    _isLogin
                        ? '¿No tienes cuenta? Regístrate gratis'
                        : '¿Ya tienes cuenta? Inicia sesión',
                    style: GoogleFonts.outfit(
                        color: AppColors.primary, fontSize: 13),
                  ),
                ),

                // — Invitado —
                TextButton(
                  onPressed: _isLoading ? null : _continueAnonymous,
                  child: Text(
                    'Probar como invitado →',
                    style: GoogleFonts.outfit(
                        color: Colors.white38, fontSize: 12),
                  ),
                ),

                const SizedBox(height: 8),
                Text(
                  'Como invitado puedes probar una lección',
                  style: GoogleFonts.outfit(
                      color: Colors.white24, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLoginForm() => [
        // — Correo —
        AuthInputField(
          controller: _emailCtrl,
          hint: 'Correo',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 14),

        // — Contraseña —
        AuthInputField(
          controller: _passCtrl,
          hint: 'Contraseña',
          icon: Icons.lock_outline,
          obscure: !_showPass,
          suffixIcon: IconButton(
            icon: Icon(
              _showPass ? Icons.visibility_off : Icons.visibility,
              color: Colors.white38,
            ),
            onPressed: () => setState(() => _showPass = !_showPass),
          ),
        ),

        // — Error —
        if (_error.isNotEmpty) ...[
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: AppColors.error.withValues(alpha: 0.3)),
            ),
            child: Text(
              _error,
              style: GoogleFonts.outfit(color: AppColors.error, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        const SizedBox(height: 24),

        // — Botón principal —
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonCyan,
              foregroundColor: AppColors.buttonCyanText,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              shadowColor: AppColors.buttonCyan.withValues(alpha: 0.4),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2.5),
                  )
                : Text(
                    'INICIAR SESIÓN',
                    style: GoogleFonts.outfit(
                        fontSize: 16, fontWeight: FontWeight.w900),
                  ),
          ),
        ),
      ];
}
