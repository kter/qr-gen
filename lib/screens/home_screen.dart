import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/qr_provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/input_section.dart';
import '../widgets/settings_section.dart';
import '../widgets/qr_display.dart';
import '../widgets/download_buttons.dart';
import '../widgets/qr_info.dart';
import '../widgets/usage_guide.dart';

/// Main home screen of the app
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _qrKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            onPressed: () => themeProvider.toggleTheme(),
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDark ? l10n.lightMode : l10n.darkMode,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getGradient(isDark),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const InputSection(),
                const SizedBox(height: 16),
                const SettingsSection(),
                const SizedBox(height: 24),
                Consumer<QRProvider>(
                  builder: (context, provider, child) {
                    if (provider.hasContent) {
                      return Column(
                        children: [
                          Center(
                            child: QRDisplay(repaintBoundaryKey: _qrKey),
                          ),
                          const SizedBox(height: 16),
                          DownloadButtons(repaintBoundaryKey: _qrKey),
                          const SizedBox(height: 16),
                          const QRInfo(),
                        ],
                      );
                    } else {
                      return const UsageGuide();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
