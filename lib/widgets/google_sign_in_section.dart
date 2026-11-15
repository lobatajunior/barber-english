import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../services/account_service.dart';
import 'google_sign_in_button.dart';

/// Botón "Continuar con Google" con su separador "o" debajo. Si el usuario es
/// invitado, vincula Google a su cuenta en vez de crear otra.
class GoogleSignInSection extends StatefulWidget {
  /// Se llama cuando entró o vinculó su cuenta con Google.
  final VoidCallback? onSuccess;

  /// Se llama tras "Iniciar sesión con esa cuenta" (el correo ya tenía cuenta).
  final VoidCallback? onSwitchedAccount;

  const GoogleSignInSection({super.key, this.onSuccess, this.onSwitchedAccount});

  @override
  State<GoogleSignInSection> createState() => _GoogleSignInSectionState();
}

class _GoogleSignInSectionState extends State<GoogleSignInSection> {
  bool _isLoading = false;
  bool _emailInUse = false;
  String _error = '';

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _isLoading = true;
      _error = '';
      _emailInUse = false;
    });
    try {
      await action();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final inUse = AccountService.isEmailInUse(e);
      setState(() {
        _emailInUse = inUse;
        _error = inUse
            ? 'Ese correo ya tiene cuenta. Tu progreso de invitado no se '
                'pasará a esa cuenta.'
            : AccountService.googleErrorMessage(e);
      });
    } catch (e) {
      if (mounted) {
        setState(() => _error = AccountService.googleErrorMessage(e));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _continue() => _run(() async {
        if (await AccountService.continueWithGoogle()) {
          widget.onSuccess?.call();
        }
      });

  void _useExisting() => _run(() async {
        await AccountService.signInExistingGoogle();
        widget.onSwitchedAccount?.call();
      });

  @override
  Widget build(BuildContext context) {
    if (!AccountService.googleSupported) return const SizedBox.shrink();
    return Column(
      children: [
        GoogleSignInButton(onPressed: _continue, isLoading: _isLoading),

        // — Error —
        if (_error.isNotEmpty) ...[
          const SizedBox(height: 12),
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
          if (_emailInUse)
            TextButton(
              onPressed: _isLoading ? null : _useExisting,
              child: Text(
                'Iniciar sesión con esa cuenta →',
                style: GoogleFonts.outfit(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],

        // — Separador —
        const SizedBox(height: 18),
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.white24)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'o',
                style: GoogleFonts.outfit(color: Colors.white38, fontSize: 13),
              ),
            ),
            const Expanded(child: Divider(color: Colors.white24)),
          ],
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
