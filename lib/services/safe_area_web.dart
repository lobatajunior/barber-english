import 'dart:js_interop';

@JS('beSafeAreaInsets')
external JSArray<JSNumber>? _beSafeAreaInsets();

/// Área segura del navegador (muesca arriba, barra de gestos abajo) en px
/// lógicos, leída de env(safe-area-inset-*) vía web/index.html. Flutter web
/// siempre deja MediaQuery.padding a 0, así que sin esto SafeArea no hace nada.
({double top, double bottom}) webSafeAreaInsets() {
  try {
    final v = _beSafeAreaInsets()?.toDart;
    if (v == null || v.length < 2) return (top: 0, bottom: 0);
    return (top: v[0].toDartDouble, bottom: v[1].toDartDouble);
  } catch (_) {
    return (top: 0, bottom: 0);
  }
}
