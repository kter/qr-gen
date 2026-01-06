import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen_app/main.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/providers/theme_provider.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => QRProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const QRGeneratorApp(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify the app title is visible
    expect(find.text('QR Code Generator'), findsOneWidget);
  });

  test('QRProvider updates content correctly', () {
    final provider = QRProvider();
    
    expect(provider.hasContent, false);
    expect(provider.content, '');
    
    provider.setContent('test');
    
    expect(provider.hasContent, true);
    expect(provider.content, 'test');
    expect(provider.characterCount, 4);
  });

  test('ThemeProvider toggles theme correctly', () {
    final provider = ThemeProvider();
    
    expect(provider.themeMode, ThemeMode.system);
    
    provider.toggleTheme();
    expect(provider.themeMode, ThemeMode.dark);
    
    provider.toggleTheme();
    expect(provider.themeMode, ThemeMode.light);
  });
}
