import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'gamification_service.dart';

/// Estadísticas de aprendizaje guardadas en silencio dentro de users/{uid}:
///
/// - wordStats/{id}: por frase objetivo de pronunciación (texto, intentos,
///   aciertos, suma de puntajes, último puntaje, fecha del último intento).
/// - typeStats/{tipo}: intentos y aciertos por tipo de ejercicio.
/// - daily/{yyyy-MM-dd}: XP ganado y ejercicios resueltos ese día.
///
/// Todas las escrituras son fire-and-forget: nunca se esperan (el future de
/// Firestore solo completa con el ack del servidor y offline no llegaría) y
/// cualquier error se ignora sin avisar. Funciona igual para invitados
/// (usuario anónimo, también tiene uid) y cuentas. No se guarda audio.
class StatsService {
  StatsService._();

  static DocumentReference<Map<String, dynamic>>? _usuario() {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return null;
      return FirebaseFirestore.instance.collection('users').doc(uid);
    } catch (_) {
      return null; // Firebase sin inicializar (tests) o sin sesión.
    }
  }

  static void _escribir(
    DocumentReference<Map<String, dynamic>> Function(
            DocumentReference<Map<String, dynamic>> usuario)
        doc,
    Map<String, dynamic> datos,
  ) {
    try {
      final u = _usuario();
      if (u == null) return;
      doc(u).set(datos, SetOptions(merge: true)).catchError((_) {});
    } catch (_) {}
  }

  /// Un intento de un ejercicio de tipo [tipo] (los 8 tipos de las lecciones).
  static void registrarTipo(String tipo, {required bool acierto}) {
    if (tipo.isEmpty) return;
    _escribir((u) => u.collection('typeStats').doc(tipo), {
      'tipo': tipo,
      'intentos': FieldValue.increment(1),
      'aciertos': FieldValue.increment(acierto ? 1 : 0),
      'ultimaFecha': FieldValue.serverTimestamp(),
    });
  }

  /// Un intento puntuado de pronunciación de la frase [texto] (0-100).
  /// [fonetica] y [traduccion] permiten repasar la frase más tarde.
  static void registrarPronunciacion({
    required String texto,
    required double puntaje,
    required bool acierto,
    String fonetica = '',
    String traduccion = '',
    String seccion = '',
  }) {
    final id = statsDocId(texto);
    if (id.isEmpty) return;
    final p = puntaje.round().clamp(0, 100);
    _escribir((u) => u.collection('wordStats').doc(id), {
      'texto': texto.trim(),
      'fonetica': fonetica,
      'traduccion': traduccion,
      'seccion': seccion,
      'intentos': FieldValue.increment(1),
      'aciertos': FieldValue.increment(acierto ? 1 : 0),
      'sumaPuntajes': FieldValue.increment(p),
      'ultimoPuntaje': p,
      'ultimaFecha': FieldValue.serverTimestamp(),
    });
  }

  /// Suma [xp] y/o [ejercicios] al día de hoy (fecha local yyyy-MM-dd).
  static void registrarDia({int xp = 0, int ejercicios = 0}) {
    if (xp == 0 && ejercicios == 0) return;
    final hoy = GamificationService.today();
    _escribir((u) => u.collection('daily').doc(hoy), {
      'fecha': hoy,
      'xp': FieldValue.increment(xp),
      'ejercicios': FieldValue.increment(ejercicios),
    });
  }
}

/// Id estable de documento para una frase: minúsculas, sin puntuación,
/// palabras unidas con "_" (máx. 120 caracteres). "Yes, please." → "yes_please".
String statsDocId(String texto) {
  final t = texto
      .toLowerCase()
      .replaceAll(RegExp(r"[^a-z0-9áéíóúñü' ]"), ' ')
      .trim()
      .replaceAll(RegExp(r'\s+'), '_');
  return t.length > 120 ? t.substring(0, 120) : t;
}
