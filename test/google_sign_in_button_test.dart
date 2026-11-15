import 'dart:io';

import 'package:barber_english/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> _pump(WidgetTester tester, double width, {bool loading = false}) {
  tester.view.physicalSize = Size(width, 800);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  return tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GoogleSignInButton(onPressed: () {}, isLoading: loading),
      ),
    ),
  ));
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);
  final hasLogo = File('assets/images/google_g.svg').existsSync();

  for (final width in [390.0, 1280.0]) {
    testWidgets('en carga a $width px: deshabilitado, indicador de 18 px',
        (tester) async {
      await _pump(tester, width, loading: true);
      expect(tester.takeException(), isNull);
      final size = tester.getSize(find.byType(GoogleSignInButton));
      expect(size.height, 55);
      expect(size.height, greaterThanOrEqualTo(48));
      expect(size.width, width - 48);
      expect(tester.getSize(find.byType(CircularProgressIndicator)),
          const Size(18, 18));
      expect(find.byType(SvgPicture), findsNothing);
      final btn = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
      expect(btn.onPressed, isNull);
    });

    testWidgets('normal a $width px: logo 20 px, 12 px de separación',
        (tester) async {
      await _pump(tester, width);
      expect(tester.takeException(), isNull);
      final logo = tester.getRect(find.byType(SvgPicture));
      final text = tester.getRect(find.text('Continuar con Google'));
      expect(logo.size, const Size(20, 20));
      expect(text.left - logo.right, 12);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    }, skip: !hasLogo);
  }
}
