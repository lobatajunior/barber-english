import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _isLogin = true;
  bool _isLoading = false;
  bool _showPass = false;
  bool _showConfirm = false;
  String _error = '';

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    setState(() {
      _error = '';
      _isLoading = true;
    });

    if (!_isLogin && _passCtrl.text != _confirmCtrl.text) {
      setState(() {
        _error = 'Las contraseñas no coinciden';
        _isLoading = false;
      });
      return;
    }
    if (_passCtrl.text.length < 6) {
      setState(() {
        _error = 'La contraseña debe tener al menos 6 caracteres';
        _isLoading = false;
      });
      return;
    }

    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailCtrl.text.trim(),
          password: _passCtrl.text.trim(),
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailCtrl.text.trim(),
          password: _passCtrl.text.trim(),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = switch (e.code) {
          'user-not-found' => 'No existe cuenta con ese email',
          'wrong-password' || 'invalid-credential' =>
            'Email o contraseña incorrectos',
          'email-already-in-use' => 'Este email ya está registrado',
          'weak-password' => 'La contraseña debe tener al menos 6 caracteres',
          'invalid-email' => 'Email no válido',
          _ => 'Error: ${e.message}',
        };
      });
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
          _error = e.code == 'operation-not-allowed'
              ? 'El acceso de invitado no está habilitado. Crea una cuenta gratuita.'
              : 'Error al entrar como invitado: ${e.message}';
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

                // — Email —
                _InputField(
                  controller: _emailCtrl,
                  hint: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),

                // — Contraseña —
                _InputField(
                  controller: _passCtrl,
                  hint: 'Contraseña',
                  icon: Icons.lock_outline,
                  obscure: !_showPass,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPass ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white38,
                    ),
                    onPressed: () =>
                        setState(() => _showPass = !_showPass),
                  ),
                ),

                // — Confirmar contraseña (solo registro) —
                if (!_isLogin) ...[
                  const SizedBox(height: 14),
                  _InputField(
                    controller: _confirmCtrl,
                    hint: 'Confirmar contraseña',
                    icon: Icons.lock_outline,
                    obscure: !_showConfirm,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white38,
                      ),
                      onPressed: () =>
                          setState(() => _showConfirm = !_showConfirm),
                    ),
                  ),
                ],

                // — Error —
                if (_error.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha:0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.error.withValues(alpha:0.3)),
                    ),
                    child: Text(
                      _error,
                      style: GoogleFonts.outfit(
                          color: AppColors.error, fontSize: 13),
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
                    onPressed: _isLoading ? null : _authenticate,
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
                            _isLogin ? 'INICIAR SESIÓN' : 'CREAR CUENTA',
                            style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                  ),
                ),
                const SizedBox(height: 14),

                // — Toggle login / registro —
                TextButton(
                  onPressed: () => setState(() {
                    _isLogin = !_isLogin;
                    _error = '';
                    _confirmCtrl.clear();
                  }),
                  child: Text(
                    _isLogin
                        ? '¿No tienes cuenta? Regístrate gratis'
                        : '¿Ya tienes cuenta? Inicia sesión',
                    style: GoogleFonts.outfit(
                        color: AppColors.primary, fontSize: 13),
                  ),
                ),

                // — Continuar sin cuenta —
                TextButton(
                  onPressed: _isLoading ? null : _continueAnonymous,
                  child: Text(
                    'Continuar sin cuenta →',
                    style: GoogleFonts.outfit(
                        color: Colors.white38, fontSize: 12),
                  ),
                ),

                const SizedBox(height: 8),
                Text(
                  'Tu progreso se guardará localmente',
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
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIcon: Icon(icon, color: AppColors.primary),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withValues(alpha:0.07),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
