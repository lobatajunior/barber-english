import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

// Lectura de las estadísticas que guarda StatsService en users/{uid}:
// wordStats, typeStats y daily. Los cálculos son funciones puras (testeables).

class WordStat {
  final String id;
  final String texto;
  final String fonetica;
  final String traduccion;
  final int intentos;
  final int aciertos;
  final int sumaPuntajes;
  final int ultimoPuntaje;

  const WordStat({
    required this.id,
    required this.texto,
    this.fonetica = '',
    this.traduccion = '',
    required this.intentos,
    this.aciertos = 0,
    required this.sumaPuntajes,
    this.ultimoPuntaje = 0,
  });

  /// Puntaje medio (0-100) de todos los intentos.
  double get promedio => intentos == 0 ? 0 : sumaPuntajes / intentos;

  factory WordStat.fromMap(String id, Map<String, dynamic> m) => WordStat(
        id: id,
        texto: m['texto']?.toString() ?? '',
        fonetica: m['fonetica']?.toString() ?? '',
        traduccion: m['traduccion']?.toString() ?? '',
        intentos: (m['intentos'] as num?)?.toInt() ?? 0,
        aciertos: (m['aciertos'] as num?)?.toInt() ?? 0,
        sumaPuntajes: (m['sumaPuntajes'] as num?)?.toInt() ?? 0,
        ultimoPuntaje: (m['ultimoPuntaje'] as num?)?.toInt() ?? 0,
      );
}

class TypeStat {
  final String tipo;
  final int intentos;
  final int aciertos;

  const TypeStat(
      {required this.tipo, required this.intentos, required this.aciertos});

  double get porcentaje => intentos == 0 ? 0 : aciertos * 100 / intentos;

  factory TypeStat.fromMap(String id, Map<String, dynamic> m) => TypeStat(
        tipo: m['tipo']?.toString() ?? id,
        intentos: (m['intentos'] as num?)?.toInt() ?? 0,
        aciertos: (m['aciertos'] as num?)?.toInt() ?? 0,
      );
}

class DayStat {
  final String fecha; // yyyy-MM-dd
  final int xp;
  final int ejercicios;

  const DayStat(
      {required this.fecha, required this.xp, required this.ejercicios});

  factory DayStat.fromMap(String id, Map<String, dynamic> m) => DayStat(
        fecha: m['fecha']?.toString() ?? id,
        xp: (m['xp'] as num?)?.toInt() ?? 0,
        ejercicios: (m['ejercicios'] as num?)?.toInt() ?? 0,
      );
}

// ── Cálculos ─────────────────────────────────────────────────────────────────

/// Las [n] frases con peor puntaje medio, con al menos [minIntentos].
List<WordStat> puntosDebiles(List<WordStat> stats,
    {int minIntentos = 2, int n = 5}) {
  final validas = stats
      .where((s) => s.intentos >= minIntentos && s.texto.trim().isNotEmpty)
      .toList()
    ..sort((a, b) {
      final c = a.promedio.compareTo(b.promedio);
      return c != 0 ? c : b.intentos.compareTo(a.intentos);
    });
  return validas.take(n).toList();
}

/// Precisión media de pronunciación (0-100) sobre todos los intentos, o null
/// si aún no hay ninguno.
double? precisionMedia(List<WordStat> stats) {
  final intentos = stats.fold<int>(0, (a, s) => a + s.intentos);
  if (intentos == 0) return null;
  final suma = stats.fold<int>(0, (a, s) => a + s.sumaPuntajes);
  return suma / intentos;
}

/// Los 7 días que terminan en [hoy] (el más antiguo primero); los días sin
/// documento quedan a cero.
List<DayStat> ultimos7Dias(List<DayStat> dias, DateTime hoy) {
  final porFecha = {for (final d in dias) d.fecha: d};
  return [
    for (var i = 6; i >= 0; i--)
      () {
        final f = fechaStr(DateTime(hoy.year, hoy.month, hoy.day - i));
        return porFecha[f] ?? DayStat(fecha: f, xp: 0, ejercicios: 0);
      }(),
  ];
}

String fechaStr(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

// ── Providers ────────────────────────────────────────────────────────────────

CollectionReference<Map<String, dynamic>>? _col(Ref ref, String nombre) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection(nombre);
}

final wordStatsProvider = StreamProvider<List<WordStat>>((ref) {
  final col = _col(ref, 'wordStats');
  if (col == null) return Stream.value(const []);
  return col.snapshots().map((q) =>
      [for (final d in q.docs) WordStat.fromMap(d.id, d.data())]);
});

final typeStatsProvider = StreamProvider<List<TypeStat>>((ref) {
  final col = _col(ref, 'typeStats');
  if (col == null) return Stream.value(const []);
  return col.snapshots().map((q) =>
      [for (final d in q.docs) TypeStat.fromMap(d.id, d.data())]);
});

final dailyStatsProvider = StreamProvider<List<DayStat>>((ref) {
  final col = _col(ref, 'daily');
  if (col == null) return Stream.value(const []);
  final desde = fechaStr(DateTime.now().subtract(const Duration(days: 6)));
  return col
      .where('fecha', isGreaterThanOrEqualTo: desde)
      .snapshots()
      .map((q) => [for (final d in q.docs) DayStat.fromMap(d.id, d.data())]);
});
