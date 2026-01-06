import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/qr_provider.dart';
import '../models/qr_settings.dart';

/// Widget to display QR code information
class QRInfo extends StatelessWidget {
  const QRInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Consumer<QRProvider>(
      builder: (context, provider, child) {
        if (!provider.hasContent) {
          return const SizedBox.shrink();
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoItem(
                  label: l10n.size,
                  value: '${provider.size.pixels}×${provider.size.pixels}px',
                  icon: Icons.aspect_ratio,
                  theme: theme,
                ),
                _InfoItem(
                  label: l10n.errorLevel,
                  value: '${provider.errorLevel.name} Level',
                  icon: Icons.security,
                  theme: theme,
                ),
                _InfoItem(
                  label: l10n.characterCount,
                  value: '${provider.characterCount}',
                  icon: Icons.text_fields,
                  theme: theme,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final ThemeData theme;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
