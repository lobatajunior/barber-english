import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Botón "Continuar con Google" en la versión oscura oficial de Google.
/// Solo estilo: la acción la decide quien lo usa (GoogleSignInSection).
///
/// Misma altura (55) y radio (16) que el botón verde "Iniciar sesión".
/// El logo es el SVG oficial de Google, sin modificar, en
/// assets/images/google_g.svg.
class GoogleSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  static const _fondo = Color(0xFF131314);
  static const _fondoPulsado = Color(0xFF1C1C1E);
  static const _borde = Color(0xFF8E918F);
  static const _texto = Color(0xFFE3E3E3);

  static const double alto = 55;
  static const double radio = 16;
  static const double tamLogo = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: alto,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16)),
          elevation: const WidgetStatePropertyAll(0),
          // Mismo aspecto deshabilitado (en carga): solo cambia el logo.
          backgroundColor: WidgetStateProperty.resolveWith((states) =>
              states.contains(WidgetState.pressed) ? _fondoPulsado : _fondo),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: const WidgetStatePropertyAll(_texto),
          side: const WidgetStatePropertyAll(BorderSide(color: _borde)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radio))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: tamLogo,
              height: tamLogo,
              child: isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(1), // indicador de 18 px
                      child: CircularProgressIndicator(
                          color: _texto, strokeWidth: 2),
                    )
                  : SvgPicture.asset(
                      'assets/images/google_g.svg',
                      width: tamLogo,
                      height: tamLogo,
                      semanticsLabel: 'Logo de Google',
                    ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                'Continuar con Google',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  color: _texto,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
