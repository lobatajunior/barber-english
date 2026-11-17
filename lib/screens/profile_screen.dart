import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/auth_provider.dart';
import '../providers/gamification_provider.dart';
import '../providers/progress_provider.dart';
import '../providers/stats_provider.dart';
import '../services/account_service.dart';
import '../widgets/stats_widgets.dart';
import 'guest_wall_screen.dart';

/// La app no tiene flujo propio para borrar la cuenta: se abre la página
/// pública de borrado (la misma que se enlaza desde la ficha de la tienda).
const kUrlBorrarCuenta =
    'https://lobatajunior.github.io/barber-english/delete-account.html';

/// Nombres en español de los tipos de ejercicio (typeStats/{tipo}).
const kNombresTipo = {
  'escuchar': 'Escuchar',
  'pronunciacion': 'Pronunciación',
  'parejas': 'Parejas',
  'completar': 'Completar',
  'ordenar': 'Ordenar',
  'opciones': 'Opciones',
  'dialogo': 'Diálogo',
  'dialogo_completo': 'Diálogo completo',
  'traducir': 'Traducir',
};

/// Mascota del avatar según el nivel (1-5).
String poseDeNivel(int nivel) =>
    const ['assets/pose1.png', 'assets/pose2.png', 'assets/pose3.png',
        'assets/pose4.png', 'assets/pose6.png'][nivel.clamp(1, 5) - 1];

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final invitado = user?.isAnonymous ?? true;

    return Container(
      color: kStatsFondo,
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text('Perfil', style: estiloTituloPantalla()),
            const SizedBox(height: 16),
            _Cabecera(user: user, invitado: invitado),
            if (invitado)
              const _AvisoInvitado()
            else ...[
              const SizedBox(height: 8),
              Text(
                'Estadísticas',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              const _Pronunciacion(),
              const _Respuestas(),
              const _Actividad(),
              const SizedBox(height: 8),
              const _BotonesCuenta(),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Cabecera: avatar, nombre, nivel, XP, racha, lecciones, correo ───────────

class _Cabecera extends ConsumerWidget {
  final User? user;
  final bool invitado;

  const _Cabecera({required this.user, required this.invitado});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gam = ref.watch(gamificationProvider);
    final lecciones = ref.watch(progressProvider).total;
    final nombrePerfil = ref.watch(userProfileProvider).valueOrNull?.nombre ?? '';
    final nombre = invitado
        ? 'Invitado'
        : [nombrePerfil, user?.displayName ?? '', user?.email?.split('@').first ?? '']
            .firstWhere((n) => n.trim().isNotEmpty, orElse: () => 'Barbero');
    final nivel5 = gam.nivel >= 5;
    final xpEnNivel = gam.xpTotal - gam.xpInicioNivel;
    final xpNecesario = gam.xpFinNivel - gam.xpInicioNivel;

    return StatsCard(
      titulo: nombre,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kStatsVerde.withValues(alpha: 0.08),
                  border: Border.all(
                      color: kStatsVerde.withValues(alpha: 0.45), width: 1.5),
                ),
                padding: const EdgeInsets.all(6),
                child: Image.asset(poseDeNivel(gam.nivel), fit: BoxFit.contain),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nv. ${gam.nivel} · ${gam.nombreNivel}',
                      style: GoogleFonts.outfit(
                        color: kStatsVerde,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: gam.progresoBarra,
                        minHeight: 6,
                        backgroundColor: Colors.white.withValues(alpha: 0.08),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(kStatsVerde),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      nivel5
                          ? '${gam.xpTotal} XP · Nivel máximo'
                          : '$xpEnNivel / $xpNecesario XP para el siguiente nivel',
                      style: GoogleFonts.outfit(
                          color: Colors.white38, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _Dato(
                  icono: '🔥',
                  valor: '${gam.rachaDias}',
                  texto: gam.rachaDias == 1 ? 'día de racha' : 'días de racha'),
              const SizedBox(width: 8),
              _Dato(
                  icono: '✂️',
                  valor: '$lecciones',
                  texto: lecciones == 1 ? 'lección' : 'lecciones'),
            ],
          ),
          if (!invitado && (user?.email ?? '').isNotEmpty) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.mail_outline_rounded,
                    color: Colors.white38, size: 16),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    user!.email!,
                    style: GoogleFonts.outfit(
                        color: Colors.white60, fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Dato extends StatelessWidget {
  final String icono;
  final String valor;
  final String texto;

  const _Dato({required this.icono, required this.valor, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(icono, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Text(
              valor,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                texto,
                style: GoogleFonts.outfit(color: Colors.white54, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Invitado ────────────────────────────────────────────────────────────────

class _AvisoInvitado extends StatelessWidget {
  const _AvisoInvitado();

  @override
  Widget build(BuildContext context) {
    return StatsCard(
      titulo: 'Crea tu cuenta',
      icono: Icons.lock_outline_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Estás como invitado. Crea una cuenta para guardar tu progreso '
            'y ver tus estadísticas.',
            style: GoogleFonts.outfit(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: () => showGuestWall(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: kStatsVerde,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Crear cuenta',
                  style: GoogleFonts.outfit(
                      fontSize: 15, fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Estadísticas ────────────────────────────────────────────────────────────

class _Pronunciacion extends ConsumerWidget {
  const _Pronunciacion();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(wordStatsProvider);
    final lista = stats.valueOrNull ?? const <WordStat>[];
    final media = precisionMedia(lista);
    final peores = puntosDebiles(lista);

    return StatsCard(
      titulo: 'Pronunciación',
      icono: Icons.mic_rounded,
      child: stats.isLoading && !stats.hasValue
          ? const CargandoStats()
          : media == null
              ? const SinDatos('Aún no hay datos')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilaPuntaje(texto: 'Precisión media', porcentaje: media),
                    if (peores.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Palabras con peor puntaje',
                        style: GoogleFonts.outfit(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      for (final p in peores)
                        FilaPuntaje(texto: p.texto, porcentaje: p.promedio),
                    ],
                  ],
                ),
    );
  }
}

class _Respuestas extends ConsumerWidget {
  const _Respuestas();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(typeStatsProvider);
    final tipos = (stats.valueOrNull ?? const <TypeStat>[])
        .where((t) => t.intentos > 0)
        .toList()
      ..sort((a, b) => b.intentos.compareTo(a.intentos));

    return StatsCard(
      titulo: 'Respuestas',
      icono: Icons.check_circle_outline_rounded,
      child: stats.isLoading && !stats.hasValue
          ? const CargandoStats()
          : tipos.isEmpty
              ? const SinDatos('Aún no hay datos')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final t in tipos)
                      FilaPuntaje(
                        texto: kNombresTipo[t.tipo] ?? t.tipo,
                        porcentaje: t.porcentaje,
                        detalle: '${t.aciertos} de ${t.intentos}',
                      ),
                  ],
                ),
    );
  }
}

class _Actividad extends ConsumerWidget {
  const _Actividad();

  static const _letras = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(dailyStatsProvider);
    final dias = ultimos7Dias(stats.valueOrNull ?? const [], DateTime.now());
    final hayDatos = dias.any((d) => d.xp > 0 || d.ejercicios > 0);
    final maxXp = dias.fold<int>(1, (m, d) => d.xp > m ? d.xp : m);

    return StatsCard(
      titulo: 'Actividad · últimos 7 días',
      icono: Icons.calendar_today_rounded,
      child: stats.isLoading && !stats.hasValue
          ? const CargandoStats()
          : !hayDatos
              ? const SinDatos('Aún no hay datos')
              : SizedBox(
                  height: 132,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (final d in dias)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                d.xp > 0 ? '${d.xp}' : '',
                                style: GoogleFonts.outfit(
                                    color: Colors.white60, fontSize: 11),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                width: 18,
                                height: 4 + 68 * d.xp / maxXp,
                                decoration: BoxDecoration(
                                  color: d.xp > 0
                                      ? kStatsVerde
                                      : Colors.white.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _letras[DateTime.parse(d.fecha).weekday - 1],
                                style: GoogleFonts.outfit(
                                  color: Colors.white54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                d.ejercicios > 0 ? '${d.ejercicios} ej.' : '',
                                style: GoogleFonts.outfit(
                                    color: Colors.white30, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
    );
  }
}

// ── Cuenta ──────────────────────────────────────────────────────────────────

class _BotonesCuenta extends StatelessWidget {
  const _BotonesCuenta();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 44,
          child: OutlinedButton.icon(
            onPressed: AccountService.signOut,
            icon: const Icon(Icons.logout_rounded, size: 18),
            label: Text('Cerrar sesión',
                style: GoogleFonts.outfit(
                    fontSize: 15, fontWeight: FontWeight.w700)),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white70,
              side: const BorderSide(color: Colors.white24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 44,
          child: TextButton(
            onPressed: () => launchUrl(Uri.parse(kUrlBorrarCuenta),
                mode: LaunchMode.externalApplication),
            child: Text('Borrar cuenta',
                style: GoogleFonts.outfit(
                    color: kStatsRojo,
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }
}
