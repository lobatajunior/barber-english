import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamData {
  final int xpTotal;
  final int rachaDias;
  final String ultimaFecha; // 'yyyy-MM-dd' or ''
  final int nivel;          // 1-5

  const GamData({
    required this.xpTotal,
    required this.rachaDias,
    required this.ultimaFecha,
    required this.nivel,
  });

  static const empty = GamData(xpTotal: 0, rachaDias: 0, ultimaFecha: '', nivel: 1);

  GamData copyWith({int? xpTotal, int? rachaDias, String? ultimaFecha, int? nivel}) =>
      GamData(
        xpTotal: xpTotal ?? this.xpTotal,
        rachaDias: rachaDias ?? this.rachaDias,
        ultimaFecha: ultimaFecha ?? this.ultimaFecha,
        nivel: nivel ?? this.nivel,
      );

  factory GamData.fromMap(Map<String, dynamic> m) => GamData(
        xpTotal: (m['xp_total'] as num?)?.toInt() ?? 0,
        rachaDias: (m['racha_dias'] as num?)?.toInt() ?? 0,
        ultimaFecha: m['ultima_leccion_fecha']?.toString() ?? '',
        nivel: (m['nivel_actual'] as num?)?.toInt() ?? 1,
      );

  Map<String, dynamic> toMap() => {
        'xp_total': xpTotal,
        'racha_dias': rachaDias,
        'ultima_leccion_fecha': ultimaFecha,
        'nivel_actual': nivel,
      };
}

class GamificationService {
  final _db = FirebaseFirestore.instance;

  // ─── Level thresholds: 1=0+ 2=500+ 3=1500+ 4=3500+ 5=7000+ ─────────────

  static int getNivel(int xp) {
    if (xp >= 7000) return 5;
    if (xp >= 3500) return 4;
    if (xp >= 1500) return 3;
    if (xp >= 500) return 2;
    return 1;
  }

  static String getNombreNivel(int nivel) {
    const n = ['', 'Apprentice Barber', 'Junior Barber', 'Barber', 'Senior Barber', 'Master Barber'];
    return n[nivel.clamp(1, 5)];
  }

  static int xpInicioNivel(int nivel) {
    const s = [0, 0, 500, 1500, 3500, 7000];
    return s[nivel.clamp(1, 5)];
  }

  static int xpFinNivel(int nivel) {
    const e = [500, 500, 1500, 3500, 7000, 10000000];
    return e[nivel.clamp(1, 5)];
  }

  static double progresoEnNivel(int xp) {
    final n = getNivel(xp);
    if (n >= 5) return 1.0;
    final ini = xpInicioNivel(n);
    final fin = xpFinNivel(n);
    return ((xp - ini) / (fin - ini)).clamp(0.0, 1.0);
  }

  static String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static String today() => _dateStr(DateTime.now());

  static String yesterday() =>
      _dateStr(DateTime.now().subtract(const Duration(days: 1)));

  // ─── Persistence ──────────────────────────────────────────────────────────

  Future<GamData> load(String? userId) async {
    if (userId != null) {
      try {
        final doc = await _db.collection('users').doc(userId).get();
        if (doc.exists && doc.data() != null) {
          return GamData.fromMap(doc.data()!);
        }
      } catch (_) {}
    }
    final prefs = await SharedPreferences.getInstance();
    return GamData(
      xpTotal: prefs.getInt('gam_xp') ?? 0,
      rachaDias: prefs.getInt('gam_racha') ?? 0,
      ultimaFecha: prefs.getString('gam_fecha') ?? '',
      nivel: prefs.getInt('gam_nivel') ?? 1,
    );
  }

  Future<void> save(String? userId, GamData data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('gam_xp', data.xpTotal);
    await prefs.setInt('gam_racha', data.rachaDias);
    await prefs.setString('gam_fecha', data.ultimaFecha);
    await prefs.setInt('gam_nivel', data.nivel);
    if (userId != null) {
      try {
        await _db
            .collection('users')
            .doc(userId)
            .set(data.toMap(), SetOptions(merge: true));
      } catch (_) {}
    }
  }
}
