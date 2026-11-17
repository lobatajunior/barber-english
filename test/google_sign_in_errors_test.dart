import 'package:barber_english/services/account_service.dart';
import 'package:barber_english/widgets/google_sign_in_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

const _msg = 'No se pudo iniciar sesión con Google. Inténtalo de nuevo.';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);
  tearDown(() => AccountService.googleRedirectError.value = null);

  test('popup cerrado, cancelado o incompleto: mensaje en español', () {
    for (final code in [
      AccountService.kGoogleIncompleto,
      'popup-closed-by-user',
      'cancelled-popup-request',
      'user-cancelled',
      'unauthorized-domain',
    ]) {
      expect(AccountService.errorMessage(FirebaseAuthException(code: code)),
          _msg,
          reason: code);
    }
    expect(
        AccountService.errorMessage(FirebaseAuthException(code: 'popup-blocked')),
        contains('bloqueó la ventana de Google'));
  });

  Future<void> montar(WidgetTester t) => t.pumpWidget(const MaterialApp(
      home: Scaffold(body: SingleChildScrollView(child: GoogleSignInSection()))));

  testWidgets('error de redirect pendiente al abrir el login: bajo el botón',
      (t) async {
    AccountService.googleRedirectError.value = _msg;
    await montar(t);
    expect(find.text(_msg), findsOneWidget);
    expect(AccountService.googleRedirectError.value, isNull);
  });

  testWidgets('error de redirect que llega después: bajo el botón', (t) async {
    await montar(t);
    expect(find.text(_msg), findsNothing);
    AccountService.googleRedirectError.value = _msg;
    await t.pump();
    expect(find.text(_msg), findsOneWidget);
  });
}
