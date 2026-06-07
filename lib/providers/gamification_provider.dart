import 'dart:async' show unawaited;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/gamification_service.dart';
import 'auth_provider.dart';

class GamificationState {
  final int xpTotal;
  final int rachaDias;
  final int nivel;            // 1-5
  final String nombreNivel;
  final double progresoBarra; // 0.0–1.0 within current level
  final int xpInicioNivel;
  final int xpFinNivel;
  final bool isLoading;

  const GamificationState({
    this.xpTotal = 0,
    this.rachaDias = 0,
    this.nivel = 1,
    this.nombreNivel = 'Apprentice Barber',
    this.progresoBarra = 0.0,
    this.xpInicioNivel = 0,
    this.xpFinNivel = 500,
    this.isLoading = true,
  });
}

class GamificationNotifier extends StateNotifier<GamificationState> {
  GamificationNotifier(this._service, this._userId)
      : super(const GamificationState()) {
    _load();
  }

  final GamificationService _service;
  final String? _userId;
  GamData _raw = GamData.empty;

  Future<void> _load() async {
    _raw = await _service.load(_userId);
    if (mounted) state = _fromRaw();
  }

  GamificationState _fromRaw() {
    final n = GamificationService.getNivel(_raw.xpTotal);
    return GamificationState(
      xpTotal: _raw.xpTotal,
      rachaDias: _raw.rachaDias,
      nivel: n,
      nombreNivel: GamificationService.getNombreNivel(n),
      progresoBarra: GamificationService.progresoEnNivel(_raw.xpTotal),
      xpInicioNivel: GamificationService.xpInicioNivel(n),
      xpFinNivel: GamificationService.xpFinNivel(n),
      isLoading: false,
    );
  }

  // Synchronous state update + background save (fire-and-forget)
  void addXP(int puntos) {
    final newXP = _raw.xpTotal + puntos;
    _raw = _raw.copyWith(xpTotal: newXP, nivel: GamificationService.getNivel(newXP));
    state = _fromRaw();
    unawaited(_service.save(_userId, _raw));
  }

  // Checks and awards daily streak. Returns XP bonus earned (0 or 20).
  Future<int> checkRacha() async {
    final hoy = GamificationService.today();
    if (_raw.ultimaFecha == hoy) return 0;

    final esConsecutivo = _raw.ultimaFecha == GamificationService.yesterday();
    final nuevaRacha = esConsecutivo ? _raw.rachaDias + 1 : 1;
    final xpBonus = esConsecutivo ? 20 : 0;
    final newXP = _raw.xpTotal + xpBonus;

    _raw = GamData(
      xpTotal: newXP,
      rachaDias: nuevaRacha,
      ultimaFecha: hoy,
      nivel: GamificationService.getNivel(newXP),
    );
    if (mounted) state = _fromRaw();
    await _service.save(_userId, _raw);
    return xpBonus;
  }
}

final gamificationServiceProvider =
    Provider<GamificationService>((_) => GamificationService());

final gamificationProvider =
    StateNotifierProvider<GamificationNotifier, GamificationState>((ref) {
  final user = ref.watch(currentUserProvider);
  final service = ref.read(gamificationServiceProvider);
  return GamificationNotifier(service, user?.uid);
});
