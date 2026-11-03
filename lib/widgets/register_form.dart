import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_colors.dart';
import '../services/account_service.dart';

const _kPrivacyUrl =
    'https://lobatajunior.github.io/barber-english/privacy-policy.html';

/// Formulario de registro: Nombre, Apellido, Correo, Contraseña y casilla de
/// novedades. Con [linkGuest] vincula la cuenta anónima actual en vez de crear
/// una nueva (conserva uid, XP y lecciones).
class RegisterForm extends StatefulWidget {
  final bool linkGuest;
  final VoidCallback? onSuccess;

  /// Solo en modo [linkGuest]: se muestra como botón cuando el correo ya tiene
  /// cuenta, para ir a iniciar sesión con ella.
  final VoidCallback? onGoToLogin;

  const RegisterForm({
    super.key,
    this.linkGuest = false,
    this.onSuccess,
    this.onGoToLogin,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nombreCtrl = TextEditingController();
  final _apellidoCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool _marketingOk = false;
  bool _showPass = false;
  bool _isLoading = false;
  bool _emailInUse = false;
  String _error = '';

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellidoCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final nombre = _nombreCtrl.text.trim();
    final apellido = _apellidoCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text;

    String error = '';
    if (nombre.isEmpty) {
      error = 'Escribe tu nombre';
    } else if (!email.contains('@') || !email.contains('.')) {
      error = 'El correo no es válido';
    } else if (password.length < 6) {
      error = 'La contraseña debe tener al menos 6 caracteres';
    }
    setState(() {
      _error = error;
      _emailInUse = false;
      _isLoading = error.isEmpty;
    });
    if (error.isNotEmpty) return;

    try {
      if (widget.linkGuest) {
        await AccountService.linkGuest(
          nombre: nombre,
          apellido: apellido,
          email: email,
          password: password,
          marketingOk: _marketingOk,
        );
      } else {
        await AccountService.register(
          nombre: nombre,
          apellido: apellido,
          email: email,
          password: password,
          marketingOk: _marketingOk,
        );
      }
      widget.onSuccess?.call();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final inUse = AccountService.isEmailInUse(e);
      setState(() {
        _emailInUse = inUse && widget.linkGuest;
        _error = _emailInUse
            ? 'Ese correo ya tiene cuenta. Inicia sesión con él: tu progreso '
                'de invitado no se pasará a esa cuenta.'
            : AccountService.errorMessage(e);
      });
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'No se pudo completar. Inténtalo de nuevo');
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _openPrivacy() =>
      launchUrl(Uri.parse(_kPrivacyUrl), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthInputField(
          controller: _nombreCtrl,
          hint: 'Nombre',
          icon: Icons.person_outline,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 14),
        AuthInputField(
          controller: _apellidoCtrl,
          hint: 'Apellido (opcional)',
          icon: Icons.badge_outlined,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 14),
        AuthInputField(
          controller: _emailCtrl,
          hint: 'Correo',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 14),
        AuthInputField(
          controller: _passCtrl,
          hint: 'Contraseña (mínimo 6 caracteres)',
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
        const SizedBox(height: 10),

        // — Novedades (sin marcar por defecto) —
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => setState(() => _marketingOk = !_marketingOk),
          child: Row(
            children: [
              Checkbox(
                value: _marketingOk,
                onChanged: (v) => setState(() => _marketingOk = v ?? false),
                activeColor: AppColors.primary,
                checkColor: Colors.black,
                side: const BorderSide(color: Colors.white38),
              ),
              Expanded(
                child: Text(
                  'Quiero recibir novedades y ofertas por correo',
                  style: GoogleFonts.outfit(
                      color: Colors.white70, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),

        // — Política de privacidad —
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Al crear tu cuenta aceptas la ',
              style: GoogleFonts.outfit(color: Colors.white38, fontSize: 12),
            ),
            GestureDetector(
              onTap: _openPrivacy,
              child: Text(
                'política de privacidad',
                style: GoogleFonts.outfit(
                  color: AppColors.primary,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),

        // — Error —
        if (_error.isNotEmpty) ...[
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
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
          if (_emailInUse && widget.onGoToLogin != null)
            TextButton(
              onPressed: widget.onGoToLogin,
              child: Text(
                'Iniciar sesión →',
                style: GoogleFonts.outfit(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
        const SizedBox(height: 20),

        // — Botón principal —
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _submit,
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
                    'CREAR CUENTA',
                    style: GoogleFonts.outfit(
                        fontSize: 16, fontWeight: FontWeight.w900),
                  ),
          ),
        ),
      ],
    );
  }
}

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const AuthInputField({
    super.key,
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
        fillColor: Colors.white.withValues(alpha: 0.07),
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
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
