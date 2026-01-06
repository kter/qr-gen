import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

/// Usage guide displayed when there's no input
class UsageGuide extends StatelessWidget {
  const UsageGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.usageGuideTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _GuideItem(
              icon: Icons.language,
              title: l10n.websiteExample,
              example: l10n.websiteExampleValue,
              theme: theme,
            ),
            const SizedBox(height: 12),
            _GuideItem(
              icon: Icons.email_outlined,
              title: l10n.emailExample,
              example: l10n.emailExampleValue,
              theme: theme,
            ),
            const SizedBox(height: 12),
            _GuideItem(
              icon: Icons.phone_outlined,
              title: l10n.phoneExample,
              example: l10n.phoneExampleValue,
              theme: theme,
            ),
            const SizedBox(height: 12),
            _GuideItem(
              icon: Icons.text_snippet_outlined,
              title: l10n.plainTextExample,
              example: l10n.plainTextExampleValue,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }
}

class _GuideItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String example;
  final ThemeData theme;

  const _GuideItem({
    required this.icon,
    required this.title,
    required this.example,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                example,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
