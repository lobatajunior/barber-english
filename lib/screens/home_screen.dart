import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../models/section.dart';
import '../models/lesson.dart';
import '../data/barber_zone_data.dart';
import '../data/street_english_data.dart';
import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';
import 'section_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatCtrl;
  late AnimationController _pulseCtrl;
  late Animation<double> _floatAnim;
  late Animation<double> _pulseAnim;

  final _sections = [
    AppSection(
      id: 'barber_zone',
      name: 'Barber Zone',
      subtitle: 'Inglés para tu barbería',
      description: 'Vocabulario y frases esenciales para atender clientes en inglés con confianza.',
      emoji: '✂️',
      accentColor: AppColors.primary,
      lessons: barberZoneLessons,
    ),
    AppSection(
      id: 'street_english',
      name: 'Street English',
      subtitle: 'Inglés para la calle',
      description: 'Expresiones cotidianas para comunicarte con fluidez fuera del trabajo.',
      emoji: '🌎',
      accentColor: AppColors.teal,
      lessons: streetEnglishLessons,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _floatCtrl = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _floatAnim = Tween<double>(begin: -9, end: 9).animate(
      CurvedAnimation(parent: _floatCtrl, curve: Curves.easeInOut),
    );

    _pulseCtrl = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.94, end: 1.06).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  String _mascotPose(int total) {
    if (total == 0) return 'assets/pose1.png';
    if (total <= 3) return 'assets/pose2.png';
    if (total <= 8) return 'assets/pose3.png';
    if (total <= 15) return 'assets/pose4.png';
    if (total <= 25) return 'assets/pose5.png';
    return 'assets/pose6.png';
  }

  String _userLevel(int total) {
    if (total < 8) return 'A1';
    if (total < 20) return 'A2';
    if (total < 40) return 'B1';
    return 'B2';
  }

  String _greeting(User? user) {
    if (user == null || user.isAnonymous) return '¡Hola, Barber!';
    final name = (user.email ?? '').split('@').first;
    return '¡Hola, $name!';
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final progress = ref.watch(progressProvider);
    final total = progress.total;

    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: SafeArea(
          child: Column(
            children: [
              _TopBar(
                greeting: _greeting(user),
                level: _userLevel(total),
                lessonCount: total,
                onLogout: () => FirebaseAuth.instance.signOut(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        _MascotHero(
                          pose: _mascotPose(total),
                          lessonCount: total,
                          floatAnim: _floatAnim,
                          pulseAnim: _pulseAnim,
                        ),
                        const SizedBox(height: 22),
                        _SectionHeader(),
                        const SizedBox(height: 14),
                        ..._sections.map(
                          (s) => _SectionCard(
                            section: s,
                            completed: progress.forSection(s.id),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SectionScreen(section: s),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Top bar ──────────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  final String greeting;
  final String level;
  final int lessonCount;
  final VoidCallback onLogout;

  const _TopBar({
    required this.greeting,
    required this.level,
    required this.lessonCount,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 8, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Barbershop pole stripe accent
          Container(
            width: 4,
            height: 38,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.teal],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  lessonCount == 0
                      ? 'Empieza tu primera lección hoy'
                      : '$lessonCount lecciones dominadas 🔥',
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary.withValues(alpha: 0.55),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Level badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.45),
                width: 1.5,
              ),
            ),
            child: Text(
              'Nv. $level',
              style: GoogleFonts.outfit(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Colors.white24, size: 18),
            onPressed: onLogout,
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
    );
  }
}

// ── Mascot hero ───────────────────────────────────────────────────────────────

class _MascotHero extends StatelessWidget {
  final String pose;
  final int lessonCount;
  final Animation<double> floatAnim;
  final Animation<double> pulseAnim;

  const _MascotHero({
    required this.pose,
    required this.lessonCount,
    required this.floatAnim,
    required this.pulseAnim,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer pulsing glow ring
          AnimatedBuilder(
            animation: pulseAnim,
            builder: (_, child) => Transform.scale(
              scale: pulseAnim.value,
              child: child,
            ),
            child: Container(
              width: 192,
              height: 192,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.03),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.07),
                  width: 22,
                ),
              ),
            ),
          ),
          // Inner ring
          Container(
            width: 138,
            height: 138,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.05),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.18),
                width: 1.5,
              ),
            ),
          ),
          // Floating mascot
          AnimatedBuilder(
            animation: floatAnim,
            builder: (_, child) => Transform.translate(
              offset: Offset(0, floatAnim.value),
              child: child,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: ScaleTransition(scale: anim, child: child),
              ),
              child: Image.asset(
                pose,
                key: ValueKey(pose),
                height: 198,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Lesson count badge (top-right of mascot)
          if (lessonCount > 0)
            Positioned(
              top: 8,
              right: 32,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  '🏆 $lessonCount',
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Section header label ─────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, AppColors.teal],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'ELIGE TU CAMINO',
          style: GoogleFonts.outfit(
            color: Colors.white38,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}

// ── Section card ─────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final AppSection section;
  final Set<int> completed;
  final VoidCallback onTap;

  const _SectionCard({
    required this.section,
    required this.completed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final done = section.completedCount(completed);
    final total = section.totalLessons;
    final ratio = section.progressRatio(completed);
    final a1Done = section
        .lessonsForLevel(Level.A1)
        .where((l) => completed.contains(l.id))
        .length;
    final a1Total = section.lessonsForLevel(Level.A1).length;
    final isStarted = done > 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              section.accentColor.withValues(alpha: 0.14),
              const Color(0xFF191919),
              const Color(0xFF111111),
            ],
            stops: const [0.0, 0.45, 1.0],
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: section.accentColor.withValues(alpha: 0.38),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: section.accentColor.withValues(alpha: 0.20),
              blurRadius: 36,
              spreadRadius: 0,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.50),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Card header ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Emoji in circle
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: section.accentColor.withValues(alpha: 0.14),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: section.accentColor.withValues(alpha: 0.45),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: section.accentColor.withValues(alpha: 0.25),
                            blurRadius: 16,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          section.emoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Title + subtitle + description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            section.name.toUpperCase(),
                            style: GoogleFonts.outfit(
                              color: section.accentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            section.subtitle,
                            style: GoogleFonts.outfit(
                              color: Colors.white54,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (section.description.isNotEmpty) ...[
                            const SizedBox(height: 7),
                            Text(
                              section.description,
                              style: GoogleFonts.outfit(
                                color: Colors.white.withValues(alpha: 0.28),
                                fontSize: 11,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Lesson counter badge
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          '$done',
                          style: GoogleFonts.outfit(
                            color: section.accentColor,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                            height: 1,
                          ),
                        ),
                        Text(
                          '/ $total',
                          style: GoogleFonts.outfit(
                            color: Colors.white30,
                            fontSize: 12,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Accent divider
              Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      section.accentColor.withValues(alpha: 0.40),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // ── Progress + CTA ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress label row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PROGRESO  ·  $done / $total lecciones',
                          style: GoogleFonts.outfit(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        Text(
                          '${(ratio * 100).round()}%',
                          style: GoogleFonts.outfit(
                            color: section.accentColor.withValues(alpha: 0.85),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),

                    // Custom gradient progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.07),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: ratio.clamp(0.0, 1.0),
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    section.accentColor,
                                    section.accentColor.withValues(alpha: 0.65),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: section.accentColor.withValues(alpha: 0.55),
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'A1 GRATIS  ·  $a1Done/$a1Total completadas',
                      style: GoogleFonts.outfit(
                        color: Colors.white24,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 22),

                    // CTA button — pill-shaped with gradient
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            section.accentColor,
                            section.accentColor.withValues(alpha: 0.72),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: section.accentColor.withValues(alpha: 0.42),
                            blurRadius: 22,
                            spreadRadius: 0,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(28),
                          onTap: onTap,
                          splashColor: Colors.white.withValues(alpha: 0.18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isStarted
                                    ? Icons.play_circle_rounded
                                    : Icons.rocket_launch_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                isStarted ? 'CONTINUAR' : 'EMPEZAR',
                                style: GoogleFonts.outfit(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
