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

  Future<void> saveProgress(
    String? userId,
    String sectionId,
    Set<int> completed,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'progress_$sectionId',
      completed.map((e) => e.toString()).toList(),
    );

    if (userId != null) {
      try {
        await _db
            .collection('users')
            .doc(userId)
            .collection('progress')
            .doc(sectionId)
            .set({
          'completedLessons': completed.toList(),
          'lastUpdated': FieldValue.serverTimestamp(),
        });
      } catch (_) {}
    }
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
