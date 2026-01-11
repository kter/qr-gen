import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/models/qr_settings.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/widgets/settings_section.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SettingsSection', () {
    testWidgets('displays error correction level label', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: SettingsSection()));

      expect(find.text('Error Correction Level'), findsOneWidget);
    });

    testWidgets('displays QR code size label', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: SettingsSection()));

      expect(find.text('QR Code Size'), findsOneWidget);
    });

    testWidgets('shows default error correction level as Medium',
        (tester) async {
      await pumpApp(tester, child: const Scaffold(body: SettingsSection()));

      // Default is M (Medium)
      expect(find.text('Medium (15%) - M'), findsOneWidget);
    });

    testWidgets('shows default size as Medium', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: SettingsSection()));

      // Default is medium (300x300)
      expect(find.text('Medium (300×300)'), findsOneWidget);
    });

    testWidgets('error correction dropdown updates provider', (tester) async {
      final qrProvider = QRProvider();

      await pumpApp(
        tester,
        child: const Scaffold(body: SettingsSection()),
        qrProvider: qrProvider,
      );

      // Initial state is M
      expect(qrProvider.errorLevel, ErrorCorrectionLevel.M);

      // Open the error correction dropdown
      await tester.tap(find.text('Medium (15%) - M'));
      await tester.pumpAndSettle();

      // Select High level
      await tester.tap(find.text('High (30%) - H').last);
      await tester.pumpAndSettle();

      // Provider should be updated
      expect(qrProvider.errorLevel, ErrorCorrectionLevel.H);
    });

    testWidgets('size dropdown updates provider', (tester) async {
      final qrProvider = QRProvider();

      await pumpApp(
        tester,
        child: const Scaffold(body: SettingsSection()),
        qrProvider: qrProvider,
      );

      // Initial state is medium
      expect(qrProvider.size, QRSize.medium);

      // Open the size dropdown
      await tester.tap(find.text('Medium (300×300)'));
      await tester.pumpAndSettle();

      // Select Large
      await tester.tap(find.text('Large (400×400)').last);
      await tester.pumpAndSettle();

      // Provider should be updated
      expect(qrProvider.size, QRSize.large);
    });

    testWidgets('all error correction options are available', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: SettingsSection()));

      // Open the error correction dropdown
      await tester.tap(find.text('Medium (15%) - M'));
      await tester.pumpAndSettle();

      // All options should be visible
      expect(find.text('Low (7%) - L'), findsOneWidget);
      expect(find.text('Medium (15%) - M'), findsWidgets);
      expect(find.text('Quartile (25%) - Q'), findsOneWidget);
      expect(find.text('High (30%) - H'), findsOneWidget);
    });

    testWidgets('all size options are available', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: SettingsSection()));

      // Open the size dropdown
      await tester.tap(find.text('Medium (300×300)'));
      await tester.pumpAndSettle();

      // All options should be visible
      expect(find.text('Small (200×200)'), findsOneWidget);
      expect(find.text('Medium (300×300)'), findsWidgets);
      expect(find.text('Large (400×400)'), findsOneWidget);
      expect(find.text('Extra Large (500×500)'), findsOneWidget);
    });
  });
}
