import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/app_colors.dart';
import '../services/account_service.dart';
import 'register_form.dart';

/// Diálogo "¿Olvidaste tu contraseña?": envía el correo de recuperación de
/// Firebase en español. No revela si el correo tiene cuenta: user-not-found
/// muestra el mismo mensaje de éxito.
Future<void> showForgotPasswordDialog(BuildContext context, String email) =>
    showDialog(
      context: context,
      builder: (_) => _ForgotPasswordDialog(initialEmail: email),
    );

class _ForgotPasswordDialog extends StatefulWidget {
  final String initialEmail;

  const _ForgotPasswordDialog({required this.initialEmail});

  @override
  State<_ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<_ForgotPasswordDialog> {
  static const _kExito = 'Te enviamos un correo para crear una nueva '
      'contraseña. Revisa también la carpeta de spam.';
  static const _kFormato = 'Revisa el formato del correo.';
  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  late final _emailCtrl = TextEditingController(text: widget.initialEmail);
  bool _isSending = false;
  String _mensaje = '';
  bool _esError = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _enviar() async {
    final email = _emailCtrl.text.trim();
    if (!_emailRegex.hasMatch(email)) {
      setState(() {
        _mensaje = _kFormato;
        _esError = true;
      });
      return;
    }

    setState(() {
      _isSending = true;
      _mensaje = '';
    });
    String mensaje = _kExito;
    bool esError = false;
    try {
      await FirebaseAuth.instance.setLanguageCode('es');
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          break;
        case 'invalid-email':
          mensaje = _kFormato;
          esError = true;
        case 'network-request-failed':
          mensaje = 'No hay conexión. Inténtalo de nuevo.';
          esError = true;
        default:
          mensaje = AccountService.errorMessage(e);
          esError = true;
      }
    } catch (_) {
      mensaje = 'No se pudo completar. Inténtalo de nuevo';
      esError = true;
    }
    if (!mounted) return;
    setState(() {
      _isSending = false;
      _mensaje = mensaje;
      _esError = esError;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = _esError ? AppColors.error : AppColors.primary;
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.45), width: 1.5),
      ),
      title: Text(
        '¿Olvidaste tu contraseña?',
        style: GoogleFonts.outfit(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthInputField(
              controller: _emailCtrl,
              hint: 'Correo',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            Text(
              'Si te registraste con Google, usa Continuar con Google.',
              style: GoogleFonts.outfit(color: Colors.white54, fontSize: 12),
            ),
            if (_mensaje.isNotEmpty) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Text(
                  _mensaje,
                  style: GoogleFonts.outfit(color: color, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: 18),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isSending ? null : _enviar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonCyan,
                  foregroundColor: AppColors.buttonCyanText,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: _isSending
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2.5),
                      )
                    : Text(
                        'Enviar correo de recuperación',
                        style: GoogleFonts.outfit(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cerrar',
              style: GoogleFonts.outfit(color: Colors.white38)),
        ),
      ],
    );
  }
}
