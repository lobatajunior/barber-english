import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'exercise_screen.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  final List<Map<String, dynamic>> lecciones = [
    {'id': 1, 'titulo': 'BASICS', 'descripcion': 'Saludos y citas'},
    {'id': 2, 'titulo': 'HAIR', 'descripcion': 'Tipos de corte'},
    {'id': 3, 'titulo': 'SERVICES', 'descripcion': 'Clima y conversación'},
    {'id': 4, 'titulo': 'NUMBERS', 'descripcion': 'Números y precios'},
    {'id': 5, 'titulo': 'STATION', 'descripcion': 'Tu estación de trabajo'},
  ];

  Set<int> leccionesCompletadas = {};

  @override
  void initState() {
    super.initState();
    _cargarProgreso();
  }

  Future<void> _cargarProgreso() async {
    final prefs = await SharedPreferences.getInstance();
    final completadas = prefs.getStringList('completadas') ?? [];
    setState(() {
      leccionesCompletadas = completadas.map((e) => int.parse(e)).toSet();
    });
  }

  Future<void> _marcarCompletada(int id) async {
    final prefs = await SharedPreferences.getInstance();
    leccionesCompletadas.add(id);
    await prefs.setStringList(
      'completadas',
      leccionesCompletadas.map((e) => e.toString()).toList(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double progreso = leccionesCompletadas.length / lecciones.length;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A1628), Color(0xFF1A53A1), Color(0xFF0D3B6E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'LECCIONES',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${leccionesCompletadas.length}/${lecciones.length}',
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF00E5FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // BARRA DE PROGRESO GENERAL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tu progreso',
                      style: GoogleFonts.outfit(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progreso,
                        backgroundColor: Colors.white12,
                        color: const Color(0xFF00E5FF),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // LISTA DE LECCIONES
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: lecciones.length,
                  itemBuilder: (context, index) {
                    final leccion = lecciones[index];
                    final completada = leccionesCompletadas.contains(
                      leccion['id'],
                    );
                    final bloqueada =
                        index > 0 &&
                        !leccionesCompletadas.contains(
                          lecciones[index - 1]['id'],
                        );

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: bloqueada
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Completa la lección anterior primero',
                                      style: GoogleFonts.outfit(),
                                    ),
                                    backgroundColor: const Color(0xFF1A53A1),
                                  ),
                                );
                              }
                            : () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ExerciseScreen(
                                      leccionId: leccion['id'],
                                      titulo: leccion['titulo'],
                                      onCompletada: () =>
                                          _marcarCompletada(leccion['id']),
                                    ),
                                  ),
                                );
                                _cargarProgreso();
                              },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: completada
                                ? const Color(0xFF00C853).withOpacity(0.1)
                                : bloqueada
                                ? Colors.white.withOpacity(0.03)
                                : Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: completada
                                  ? const Color(0xFF00C853).withOpacity(0.5)
                                  : bloqueada
                                  ? Colors.white12
                                  : const Color(0xFF00E5FF).withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              // ICONO
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: completada
                                      ? const Color(0xFF00C853).withOpacity(0.2)
                                      : bloqueada
                                      ? Colors.white10
                                      : const Color(
                                          0xFF00E5FF,
                                        ).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  completada
                                      ? Icons.check_circle_rounded
                                      : bloqueada
                                      ? Icons.lock_rounded
                                      : Icons.cut,
                                  color: completada
                                      ? const Color(0xFF00C853)
                                      : bloqueada
                                      ? Colors.white30
                                      : const Color(0xFF00E5FF),
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 16),
                              // TEXTO
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'LECCIÓN ${leccion['id']}',
                                      style: GoogleFonts.outfit(
                                        color: completada
                                            ? const Color(0xFF00C853)
                                            : bloqueada
                                            ? Colors.white30
                                            : const Color(0xFF00E5FF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Text(
                                      leccion['titulo'],
                                      style: GoogleFonts.outfit(
                                        color: bloqueada
                                            ? Colors.white30
                                            : Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      leccion['descripcion'],
                                      style: GoogleFonts.outfit(
                                        color: bloqueada
                                            ? Colors.white.withOpacity(0.2)
                                            : Colors.white54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                completada
                                    ? Icons.star_rounded
                                    : bloqueada
                                    ? Icons.lock_rounded
                                    : Icons.arrow_forward_ios,
                                color: completada
                                    ? const Color(0xFF00C853)
                                    : Colors.white30,
                                size: completada ? 24 : 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
