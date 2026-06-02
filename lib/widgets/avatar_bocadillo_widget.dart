import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class AvatarBocadilloWidget extends StatelessWidget {
  final String texto;
  final String pose;

  const AvatarBocadilloWidget({
    super.key,
    required this.texto,
    required this.pose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            pose,
            height: 90,
            width: 72,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => Image.asset(
              'assets/mascota.png',
              height: 90,
              width: 72,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: CustomPaint(
              painter: _BubbleTailPainter(),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2C4E),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  texto,
                  style: GoogleFonts.outfit(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()
      ..color = const Color(0xFF1A2C4E)
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const tailX = 10.0;
    const tailY = 58.0;
    const tailH = 10.0;

    final path = Path()
      ..moveTo(tailX, tailY)
      ..lineTo(0, tailY + tailH / 2)
      ..lineTo(tailX, tailY + tailH)
      ..close();

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(_BubbleTailPainter old) => false;
}
