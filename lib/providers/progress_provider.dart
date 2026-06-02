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

  ProgressNotifier(this._service, this._userId)
      : super(const ProgressState(isLoading: true)) {
    _load();
  }

  Future<void> _load() async {
    final results = await Future.wait(
      _sections.map((s) => _service.loadProgress(_userId, s)),
    );
    state = ProgressState(
      completed: {
        for (var i = 0; i < _sections.length; i++) _sections[i]: results[i],
      },
    );
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
