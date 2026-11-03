import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).valueOrNull;
});

class UserProfile {
  final String nombre;
  // true si el dato viene solo de la caché local: el nombre podría existir ya
  // en el servidor, así que no se debe preguntar todavía.
  final bool fromCache;

  const UserProfile({required this.nombre, required this.fromCache});
}

// Perfil del usuario en users/{uid} (mismo documento que el XP y la racha).
final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return Stream.value(null);
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots()
      .map((s) => UserProfile(
            nombre: (s.data()?['nombre'] as String? ?? '').trim(),
            fromCache: s.metadata.isFromCache,
          ));
});
