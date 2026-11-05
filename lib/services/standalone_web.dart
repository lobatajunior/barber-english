import 'dart:js_interop';

@JS('matchMedia')
external _MediaQueryList _matchMedia(String query);

extension type _MediaQueryList(JSObject _) implements JSObject {
  external bool get matches;
}

@JS('navigator.standalone')
external bool? get _iosStandalone;

/// true si la web se abrió como app instalada (pantalla de inicio). Ahí el
/// popup de Google no vuelve a la app, así que se usa redirect.
bool isStandaloneWebApp() =>
    _matchMedia('(display-mode: standalone)').matches ||
    (_iosStandalone ?? false);
