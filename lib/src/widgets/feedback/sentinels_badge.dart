import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

enum SentinelsBadgeType {
  primary,
  secondary,
  success,
  warning,
  danger,
  info,
}

class SentinelsBadge extends StatelessWidget {
  const SentinelsBadge({
    super.key,
    required this.label,
    this.type = SentinelsBadgeType.primary,
    this.isSoft = false,
  });

  final String label;
  final SentinelsBadgeType type;
  final bool isSoft;

  Color _getColor(BuildContext context) {
    switch (type) {
      case SentinelsBadgeType.primary:
        return Theme.of(context).primaryColor;
      case SentinelsBadgeType.secondary:
        return Theme.of(context).colorScheme.secondary;
      case SentinelsBadgeType.success:
        return SentinelsColors.success;
      case SentinelsBadgeType.warning:
        return SentinelsColors.warning;
      case SentinelsBadgeType.danger:
        return SentinelsColors.danger;
      case SentinelsBadgeType.info:
        return SentinelsColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final bgColor = isSoft ? color.withValues(alpha: 0.1) : color;
    final textColor = isSoft ? color : Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SentinelsSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(SentinelsRadius.sm),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
