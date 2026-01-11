import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen_app/models/qr_settings.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/widgets/qr_display.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('QRDisplay', () {
    testWidgets('does not render when no content', (tester) async {
      final qrProvider = QRProvider();
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: QRDisplay(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // QrImageView should not be present
      expect(find.byType(QrImageView), findsNothing);
    });

    testWidgets('renders QR code when content exists', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('https://example.com');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: QRDisplay(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // QrImageView should be present
      expect(find.byType(QrImageView), findsOneWidget);
    });

    testWidgets('QR code wrapped in RepaintBoundary', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: QRDisplay(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      expect(find.byType(RepaintBoundary), findsWidgets);
    });

    testWidgets('has white background container', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: QRDisplay(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // Find the container with white background
      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byType(QrImageView),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isNotNull);
    });

    testWidgets('updates when provider content changes', (tester) async {
      final qrProvider = QRProvider();
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: QRDisplay(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // Initially no QR code
      expect(find.byType(QrImageView), findsNothing);

      // Add content
      qrProvider.setContent('new content');
      await tester.pumpAndSettle();

      // QR code should appear
      expect(find.byType(QrImageView), findsOneWidget);
    });

    testWidgets('responds to size changes from provider', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: QRDisplay(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // Default size is medium (300px)
      final qrImageView1 = tester.widget<QrImageView>(find.byType(QrImageView));
      expect(qrImageView1.size, 300.0);

      // Change to large
      qrProvider.setSize(QRSize.large);
      await tester.pumpAndSettle();

      final qrImageView2 = tester.widget<QrImageView>(find.byType(QrImageView));
      expect(qrImageView2.size, 400.0);
    });
  });
}
