import 'dart:async' show StreamSubscription;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/progress_service.dart';
import '../services/speech_service.dart';
import 'auth_provider.dart';

// ── Progress state ──────────────────────────────────────────────────────────

class ProgressState {
  final Map<String, Set<int>> completed;
  final bool isLoading;

  const ProgressState({this.completed = const {}, this.isLoading = false});

  int get total =>
      completed.values.fold(0, (sum, set) => sum + set.length);

  Set<int> forSection(String sectionId) => completed[sectionId] ?? {};

  ProgressState copyWith({
    Map<String, Set<int>>? completed,
    bool? isLoading,
  }) {
    return ProgressState(
      completed: completed ?? this.completed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// ── Notifier ────────────────────────────────────────────────────────────────

class ProgressNotifier extends StateNotifier<ProgressState> {
  final ProgressService _service;
  final String? _userId;

  static const _sections = ['barber_zone', 'street_english'];

  final List<StreamSubscription<Set<int>>> _subs = [];

  ProgressNotifier(this._service, this._userId)
      : super(const ProgressState(isLoading: true)) {
    _watch();
  }

  // Cache first, then server updates, one listener per section.
  void _watch() {
    for (final section in _sections) {
      _subs.add(_service.watchProgress(_userId, section).listen((lessons) {
        final updated = Map<String, Set<int>>.from(state.completed);
        updated[section] = lessons;
        state = ProgressState(
          completed: updated,
          isLoading: updated.length < _sections.length,
        );
      }));
    }
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    super.dispose();
  }

  Future<void> completeLesson(String sectionId, int lessonId) async {
    final updated = Map<String, Set<int>>.from(state.completed);
    final section = Set<int>.from(updated[sectionId] ?? {});
    section.add(lessonId);
    updated[sectionId] = section;
    state = state.copyWith(completed: updated);
    await _service.saveProgress(_userId, sectionId, section);
  }
}

// ── Providers ───────────────────────────────────────────────────────────────

final progressServiceProvider = Provider<ProgressService>((_) => ProgressService());

final speechServiceProvider = Provider<SpeechService>((ref) {
  final service = SpeechService();
  ref.onDispose(service.dispose);
  return service;
});

final progressProvider =
    StateNotifierProvider<ProgressNotifier, ProgressState>((ref) {
  final user = ref.watch(currentUserProvider);
  final service = ref.read(progressServiceProvider);
  return ProgressNotifier(service, user?.uid);
});
