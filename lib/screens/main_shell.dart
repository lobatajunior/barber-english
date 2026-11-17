import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';
import 'practice_screen.dart';
import 'profile_screen.dart';

const _kBarraFondo = Color(0xFF0D0D0D);
const _kVerde = Color(0xFF00E676);
const _kGris = Color(0xFF8A8A8A);

/// Inicio, Práctica y Perfil con la barra inferior. Las lecciones y los
/// ejercicios se abren con Navigator.push encima de esta pantalla, así que
/// ahí la barra no se ve.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080808),
      // IndexedStack conserva el estado (y animaciones) de cada pestaña.
      body: IndexedStack(
        index: _tab,
        children: const [
          HomeScreen(),
          PracticeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: _BarraInferior(
        actual: _tab,
        onTap: (i) => setState(() => _tab = i),
      ),
    );
  }
}

class _BarraInferior extends StatelessWidget {
  final int actual;
  final ValueChanged<int> onTap;

  const _BarraInferior({required this.actual, required this.onTap});

  static const _items = [
    (Icons.home_rounded, 'Inicio'),
    (Icons.fitness_center_rounded, 'Práctica'),
    (Icons.person_rounded, 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: _kBarraFondo,
        border: Border(top: BorderSide(color: Color(0xFF222222), width: 1)),
      ),
      // Respeta el área segura de abajo (barra de gestos).
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              for (final (i, (icono, texto)) in _items.indexed)
                Expanded(
                  child: _BotonBarra(
                    icono: icono,
                    texto: texto,
                    activo: i == actual,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BotonBarra extends StatelessWidget {
  final IconData icono;
  final String texto;
  final bool activo;
  final VoidCallback onTap;

  const _BotonBarra({
    required this.icono,
    required this.texto,
    required this.activo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = activo ? _kVerde : _kGris;
    return Semantics(
      button: true,
      selected: activo,
      label: texto,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, color: color, size: 24),
            const SizedBox(height: 3),
            Text(
              texto,
              style: GoogleFonts.outfit(
                color: color,
                fontSize: 11,
                fontWeight: activo ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
