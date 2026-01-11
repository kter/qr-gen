@Tags(['golden'])
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/providers/theme_provider.dart';
import 'package:qr_gen_app/screens/home_screen.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('Golden Tests - HomeScreen', () {
    testWidgets('initial empty state', (tester) async {
      await pumpApp(tester, child: const HomeScreen());

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/home_screen_empty.png'),
      );
    });

    testWidgets('with QR code generated', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('https://example.com');

      await pumpApp(tester, child: const HomeScreen(), qrProvider: qrProvider);

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/home_screen_with_qr.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      final themeProvider = ThemeProvider();
      themeProvider.setThemeMode(ThemeMode.dark);

      await pumpApp(
        tester,
        child: const HomeScreen(),
        themeProvider: themeProvider,
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/home_screen_dark.png'),
      );
    });

    testWidgets('dark theme with QR code', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('https://example.com');
      final themeProvider = ThemeProvider();
      themeProvider.setThemeMode(ThemeMode.dark);

      await pumpApp(
        tester,
        child: const HomeScreen(),
        qrProvider: qrProvider,
        themeProvider: themeProvider,
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/home_screen_dark_with_qr.png'),
      );
    });
  });
}
