import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Piezas comunes de Práctica y Perfil.

const kStatsFondo = Color(0xFF080808);
const kStatsTarjeta = Color(0xFF111111);
const kStatsVerde = Color(0xFF00E676);
const kStatsRojo = Color(0xFFFF5252);
const kStatsGold = Color(0xFFFFD600);

TextStyle estiloTituloPantalla() => GoogleFonts.outfit(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w900,
    );

/// Rojo bajo 60 %, amarillo de 60 a 79 %, verde desde 80 %.
Color colorPorcentaje(double p) {
  if (p < 60) return kStatsRojo;
  if (p < 80) return kStatsGold;
  return kStatsVerde;
}

class StatsCard extends StatelessWidget {
  final String titulo;
  final IconData? icono;
  final Widget child;

  const StatsCard(
      {super.key, required this.titulo, this.icono, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: kStatsTarjeta,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (icono != null) ...[
                Icon(icono, color: kStatsVerde, size: 18),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  titulo,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

/// Texto, porcentaje coloreado y barra fina del mismo color.
class FilaPuntaje extends StatelessWidget {
  final String texto;
  final String subtitulo;
  final double porcentaje;
  final String detalle;

  const FilaPuntaje({
    super.key,
    required this.texto,
    this.subtitulo = '',
    required this.porcentaje,
    this.detalle = '',
  });

  @override
  Widget build(BuildContext context) {
    final color = colorPorcentaje(porcentaje);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texto,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (subtitulo.isNotEmpty || detalle.isNotEmpty)
                      Text(
                        [subtitulo, detalle]
                            .where((s) => s.isNotEmpty)
                            .join(' · '),
                        style: GoogleFonts.outfit(
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${porcentaje.round()}%',
                style: GoogleFonts.outfit(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: (porcentaje / 100).clamp(0.0, 1.0),
              minHeight: 5,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

class SinDatos extends StatelessWidget {
  final String texto;
  const SinDatos(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        texto,
        style: GoogleFonts.outfit(color: Colors.white54, fontSize: 14),
      ),
    );
  }
}

class CargandoStats extends StatelessWidget {
  const CargandoStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2, color: kStatsVerde),
        ),
      ),
    );
  }
}
