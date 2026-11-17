import 'dart:js_interop';

@JS('matchMedia')
external _MediaQueryList _matchMedia(String query);

extension type _MediaQueryList(JSObject _) implements JSObject {
  external bool get matches;
}

@JS('navigator.standalone')
external bool? get _iosStandalone;

@JS('navigator.userAgent')
external String get _userAgent;

@JS('navigator.maxTouchPoints')
external int? get _maxTouchPoints;

/// true si la web se abrió como app instalada (pantalla de inicio). Ahí el
/// popup de Google no vuelve a la app, así que se usa redirect.
bool isStandaloneWebApp() =>
    _matchMedia('(display-mode: standalone)').matches ||
    (_iosStandalone ?? false);

/// true en navegadores de móvil o tablet (Android, iPhone, iPad; también los
/// navegadores internos de apps como Instagram). Ahí el "popup" de Google es
/// otra pestaña y su resultado puede perderse al volver, así que se usa
/// redirect.
bool isMobileWebBrowser() {
  final ua = _userAgent.toLowerCase();
  return ua.contains('android') ||
      ua.contains('iphone') ||
      ua.contains('ipad') ||
      ua.contains('ipod') ||
      // iPadOS se presenta como Mac de escritorio.
      (ua.contains('macintosh') && (_maxTouchPoints ?? 0) > 1);
}
