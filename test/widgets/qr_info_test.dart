import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/models/qr_settings.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/widgets/qr_info.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('QRInfo', () {
    testWidgets('does not render when no content', (tester) async {
      final qrProvider = QRProvider();

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      // Card should not be visible
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('displays size information when content exists',
        (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      // Default size is medium (300x300)
      expect(find.text('300×300px'), findsOneWidget);
      expect(find.text('Size'), findsOneWidget);
    });

    testWidgets('displays error level information', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      // Default error level is M
      expect(find.text('M Level'), findsOneWidget);
      expect(find.text('Error Level'), findsOneWidget);
    });

    testWidgets('displays character count', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      // 'test' has 4 characters
      expect(find.text('4'), findsOneWidget);
      expect(find.text('Characters'), findsOneWidget);
    });

    testWidgets('updates when provider changes', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      // Initial state
      expect(find.text('4'), findsOneWidget);
      expect(find.text('300×300px'), findsOneWidget);

      // Change content and size
      qrProvider.setContent('longer text here');
      qrProvider.setSize(QRSize.large);
      await tester.pumpAndSettle();

      // Updated values
      expect(find.text('16'), findsOneWidget);
      expect(find.text('400×400px'), findsOneWidget);
    });

    testWidgets('shows correct icons', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      expect(find.byIcon(Icons.aspect_ratio), findsOneWidget);
      expect(find.byIcon(Icons.security), findsOneWidget);
      expect(find.byIcon(Icons.text_fields), findsOneWidget);
    });

    testWidgets('wrapped in Card widget', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');

      await pumpApp(
        tester,
        child: const Scaffold(body: QRInfo()),
        qrProvider: qrProvider,
      );

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
