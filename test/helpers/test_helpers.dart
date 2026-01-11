import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen_app/l10n/app_localizations.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/providers/theme_provider.dart';
import 'package:qr_gen_app/theme/app_theme.dart';

/// Creates a test app wrapper with all necessary providers and localizations
/// Uses ChangeNotifierProvider.value when a provider is passed to correctly
/// preserve the provider instance's state.
Widget createTestApp({
  required Widget child,
  QRProvider? qrProvider,
  ThemeProvider? themeProvider,
}) {
  final qr = qrProvider ?? QRProvider();
  final theme = themeProvider ?? ThemeProvider();

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<QRProvider>.value(value: qr),
      ChangeNotifierProvider<ThemeProvider>.value(value: theme),
    ],
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      locale: const Locale('en'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: child,
    ),
  );
}

/// Pumps the widget and waits for it to settle
Future<void> pumpApp(
  WidgetTester tester, {
  required Widget child,
  QRProvider? qrProvider,
  ThemeProvider? themeProvider,
}) async {
  await tester.pumpWidget(
    createTestApp(
      child: child,
      qrProvider: qrProvider,
      themeProvider: themeProvider,
    ),
  );
  await tester.pumpAndSettle();
}
