import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

import 'sentinels_card.dart';

class SentinelsStatCard extends StatelessWidget {
  const SentinelsStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.trendValue,
    this.isTrendUp = true,
  });

  final String title;
  final String value;
  final IconData icon;
  final String? trendValue;
  final bool isTrendUp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color trendColor =
        isTrendUp ? SentinelsColors.success : SentinelsColors.danger;
    final IconData trendIcon =
        isTrendUp ? Icons.arrow_upward : Icons.arrow_downward;

    return SentinelsCard(
      padding: const EdgeInsets.all(SentinelsSpacing.lg),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color
                        ?.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: SentinelsSpacing.sm),
                Text(
                  value,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (trendValue != null) ...[
                  const SizedBox(height: SentinelsSpacing.md),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SentinelsSpacing.xs,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: trendColor.withValues(alpha: 0.1),
                          borderRadius:
                              BorderRadius.circular(SentinelsRadius.sm),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(trendIcon, size: 12, color: trendColor),
                            const SizedBox(width: 4),
                            Text(
                              trendValue!,
                              style: TextStyle(
                                color: trendColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: SentinelsSpacing.sm),
                      Text(
                        'vs last month',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color
                              ?.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(SentinelsSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
