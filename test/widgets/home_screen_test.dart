import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/screens/home_screen.dart';
import 'package:qr_gen_app/widgets/usage_guide.dart';
import 'package:qr_gen_app/widgets/qr_display.dart';
import 'package:qr_gen_app/widgets/download_buttons.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('shows UsageGuide when no content is entered', (tester) async {
      await pumpApp(tester, child: const HomeScreen());

      // UsageGuide should be visible
      expect(find.byType(UsageGuide), findsOneWidget);

      // QR display and download buttons should NOT be visible
      expect(find.byType(QRDisplay), findsNothing);
      expect(find.byType(DownloadButtons), findsNothing);
    });

    testWidgets('shows QR code when content is entered', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('https://example.com');

      await pumpApp(tester, child: const HomeScreen(), qrProvider: qrProvider);

      // QR display and download buttons should be visible
      expect(find.byType(QRDisplay), findsOneWidget);
      expect(find.byType(DownloadButtons), findsOneWidget);

      // UsageGuide should NOT be visible
      expect(find.byType(UsageGuide), findsNothing);
    });

    testWidgets('displays app title in AppBar', (tester) async {
      await pumpApp(tester, child: const HomeScreen());

      expect(find.text('QR Code Generator'), findsOneWidget);
    });

    testWidgets('shows dark mode icon when in light mode', (tester) async {
      await pumpApp(tester, child: const HomeScreen());

      // In light/system mode, the toggle button shows dark_mode icon
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    });

    testWidgets('QR display visibility toggles with content', (tester) async {
      final qrProvider = QRProvider();

      await pumpApp(tester, child: const HomeScreen(), qrProvider: qrProvider);

      // Initially no content - UsageGuide shown
      expect(find.byType(UsageGuide), findsOneWidget);
      expect(find.byType(QRDisplay), findsNothing);

      // Add content
      qrProvider.setContent('test');
      await tester.pumpAndSettle();

      // Now QR display should be shown
      expect(find.byType(QRDisplay), findsOneWidget);
      expect(find.byType(UsageGuide), findsNothing);

      // Clear content
      qrProvider.clear();
      await tester.pumpAndSettle();

      // Back to UsageGuide
      expect(find.byType(UsageGuide), findsOneWidget);
      expect(find.byType(QRDisplay), findsNothing);
    });
  });
}
