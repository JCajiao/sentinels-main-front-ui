import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsProgressCard extends StatelessWidget {
  const SentinelsProgressCard({
    super.key,
    required this.title,
    required this.value,
    required this.progress,
    this.subtitle,
    this.color,
  });

  final String title;
  final String value;
  final double progress; // 0.0 to 1.0
  final String? subtitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? theme.primaryColor;

    return SentinelsCard(
      padding: const EdgeInsets.all(SentinelsSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color:
                      theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: SentinelsSpacing.lg),
          ClipRRect(
            borderRadius: BorderRadius.circular(SentinelsRadius.pill),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: indicatorColor.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
              minHeight: 6,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: SentinelsSpacing.sm),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
