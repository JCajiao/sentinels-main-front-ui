import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsToast {
  static void show({
    required BuildContext context,
    required String message,
    SentinelsBadgeType type = SentinelsBadgeType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color getColor() {
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

    IconData getIcon() {
      switch (type) {
        case SentinelsBadgeType.success:
          return Icons.check_circle;
        case SentinelsBadgeType.warning:
          return Icons.warning;
        case SentinelsBadgeType.danger:
          return Icons.error;
        default:
          return Icons.info;
      }
    }

    final color = getColor();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(getIcon(), color: Colors.white, size: 20),
            const SizedBox(width: SentinelsSpacing.md),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
        ),
        duration: duration,
        margin: const EdgeInsets.all(SentinelsSpacing.lg),
        elevation: SentinelsElevation.md,
      ),
    );
  }
}
