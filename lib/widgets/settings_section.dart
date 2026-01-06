import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/qr_provider.dart';
import '../models/qr_settings.dart';

/// Settings section with dropdowns for error correction and size
class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ErrorCorrectionDropdown(l10n: l10n),
            const SizedBox(height: 16),
            _SizeDropdown(l10n: l10n),
          ],
        ),
      ),
    );
  }
}

class _ErrorCorrectionDropdown extends StatelessWidget {
  final AppLocalizations l10n;

  const _ErrorCorrectionDropdown({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Consumer<QRProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.errorCorrectionLevel,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<ErrorCorrectionLevel>(
              initialValue: provider.errorLevel,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              items: ErrorCorrectionLevel.values.map((level) {
                return DropdownMenuItem(
                  value: level,
                  child: Text(_getErrorLevelLabel(l10n, level)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  provider.setErrorLevel(value);
                }
              },
            ),
          ],
        );
      },
    );
  }

  String _getErrorLevelLabel(AppLocalizations l10n, ErrorCorrectionLevel level) {
    switch (level) {
      case ErrorCorrectionLevel.L:
        return l10n.lowLevel;
      case ErrorCorrectionLevel.M:
        return l10n.mediumLevel;
      case ErrorCorrectionLevel.Q:
        return l10n.quartileLevel;
      case ErrorCorrectionLevel.H:
        return l10n.highLevel;
    }
  }
}

class _SizeDropdown extends StatelessWidget {
  final AppLocalizations l10n;

  const _SizeDropdown({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Consumer<QRProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.qrCodeSize,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<QRSize>(
              initialValue: provider.size,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              items: QRSize.values.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: Text(_getSizeLabel(l10n, size)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  provider.setSize(value);
                }
              },
            ),
          ],
        );
      },
    );
  }

  String _getSizeLabel(AppLocalizations l10n, QRSize size) {
    switch (size) {
      case QRSize.small:
        return l10n.sizeSmall;
      case QRSize.medium:
        return l10n.sizeMedium;
      case QRSize.large:
        return l10n.sizeLarge;
      case QRSize.extraLarge:
        return l10n.sizeExtraLarge;
    }
  }
}
