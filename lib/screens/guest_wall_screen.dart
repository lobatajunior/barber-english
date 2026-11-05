import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_theme.dart';
import '../services/account_service.dart';
import '../widgets/google_sign_in_section.dart';
import '../widgets/register_form.dart';

/// Muestra el muro de registro para invitados. Devuelve true si el invitado
/// creó su cuenta (vinculada: mismo uid, XP y lecciones).
Future<bool> showGuestWall(BuildContext context) async {
  final result = await Navigator.of(context).push<bool>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => const GuestWallScreen(),
    ),
  );
  return result ?? false;
}

class GuestWallScreen extends StatelessWidget {
  const GuestWallScreen({super.key});

  // El correo ya tiene cuenta: se cierra la sesión de invitado (su progreso
  // no pasa a esa cuenta) y main.dart muestra el login. Antes se cierran las
  // pantallas abiertas para que el login no quede debajo de ellas.
  Future<void> _goToLogin(BuildContext context) async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    await AccountService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close,
                        color: Colors.white38, size: 22),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ),
                Image.asset('assets/pose2.png', height: 120),
                const SizedBox(height: 16),
                Text(
                  '¡Buen trabajo!',
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Crea tu cuenta gratis para guardar tu progreso y seguir '
                  'aprendiendo',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                      color: Colors.white60, fontSize: 14, height: 1.4),
                ),
                const SizedBox(height: 28),
                GoogleSignInSection(
                  onSuccess: () => Navigator.pop(context, true),
                  onSwitchedAccount: () => Navigator.of(context)
                      .popUntil((route) => route.isFirst),
                ),
                RegisterForm(
                  linkGuest: true,
                  onSuccess: () => Navigator.pop(context, true),
                  onGoToLogin: () => _goToLogin(context),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'Ahora no',
                    style: GoogleFonts.outfit(
                        color: Colors.white38, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
