import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Set<int>> loadProgress(String? userId, String sectionId) async {
    // Always try Firestore first for authenticated users
    if (userId != null) {
      try {
        final doc = await _db
            .collection('users')
            .doc(userId)
            .collection('progress')
            .doc(sectionId)
            .get();

        if (doc.exists) {
          final list = List<int>.from(doc.data()?['completedLessons'] ?? []);
          return list.toSet();
        }
      } catch (_) {}
    }

    // Fallback to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('progress_$sectionId') ?? [];
    return list.map(int.parse).toSet();
  }

  // Emits the cached document immediately (persistence) and again whenever the
  // server sends something different. Falls back to SharedPreferences when the
  // document doesn't exist or the listener errors.
  Stream<Set<int>> watchProgress(String? userId, String sectionId) async* {
    if (userId != null) {
      try {
        await for (final doc in _db
            .collection('users')
            .doc(userId)
            .collection('progress')
            .doc(sectionId)
            .snapshots()) {
          if (doc.exists) {
            yield List<int>.from(doc.data()?['completedLessons'] ?? []).toSet();
          } else {
            yield await _loadLocal(sectionId);
          }
        }
        return;
      } catch (_) {}
    }
    yield await _loadLocal(sectionId);
  }

  Future<Set<int>> _loadLocal(String sectionId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('progress_$sectionId') ?? [];
    return list.map(int.parse).toSet();
  }

  Future<void> saveProgress(
    String? userId,
    String sectionId,
    Set<int> completed,
  ) async {
    // Fire the Firestore write first: its local echo reaches the snapshot
    // listener right away, so a stale server event can't overwrite fresh state
    // while we wait on SharedPreferences. Not awaited: the future only completes
    // on server ack, so offline it would hang the caller forever.
    if (userId != null) {
      try {
        _db
            .collection('users')
            .doc(userId)
            .collection('progress')
            .doc(sectionId)
            .set({
          'completedLessons': completed.toList(),
          'lastUpdated': FieldValue.serverTimestamp(),
        }).catchError((_) {});
      } catch (_) {}
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'progress_$sectionId',
      completed.map((e) => e.toString()).toList(),
    );
  }

  Future<void> markComplete(
    String? userId,
    String sectionId,
    int lessonId,
  ) async {
    final current = await loadProgress(userId, sectionId);
    current.add(lessonId);
    await saveProgress(userId, sectionId, current);
  }
}
