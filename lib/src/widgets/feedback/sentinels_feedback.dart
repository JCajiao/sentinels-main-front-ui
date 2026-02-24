import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

import 'sentinels_badge.dart';
import 'sentinels_button.dart';

class SentinelsModal {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
    String? cancelLabel = 'Cancel',
    String? confirmLabel = 'Confirm',
    VoidCallback? onConfirm,
    bool isDestructive = false,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final adminTheme = theme.sentinelsAdminTheme;

        return AlertDialog(
          backgroundColor: adminTheme.contentBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.md),
          ),
          title: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: adminTheme.contentOnBackground,
            ),
          ),
          content: content,
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: SentinelsSpacing.lg,
            vertical: SentinelsSpacing.md,
          ),
          actions: actions ??
              [
                SentinelsButton(
                  label: cancelLabel ?? 'Cancel',
                  type: SentinelsButtonType.text,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SentinelsButton(
                  label: confirmLabel ?? 'Confirm',
                  type: isDestructive
                      ? SentinelsButtonType.danger
                      : SentinelsButtonType.primary,
                  onPressed: () {
                    if (onConfirm != null) onConfirm();
                    Navigator.of(context).pop();
                  },
                ),
              ],
        );
      },
    );
  }
}

class SentinelsAlert extends StatelessWidget {
  const SentinelsAlert({
    super.key,
    required this.message,
    this.type = SentinelsBadgeType.info,
    this.icon,
    this.onClose,
  });

  final String message;
  final SentinelsBadgeType type;
  final IconData? icon;
  final VoidCallback? onClose;

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

  IconData _getDefaultIcon() {
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

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final bgColor = color.withValues(alpha: 0.1);
    final displayIcon = icon ?? _getDefaultIcon();

    return Container(
      padding: const EdgeInsets.all(SentinelsSpacing.md),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(SentinelsRadius.sm),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(displayIcon, color: color, size: 20),
          const SizedBox(width: SentinelsSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: color.withValues(alpha: 0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: SentinelsSpacing.sm),
            InkWell(
              onTap: onClose,
              child: Icon(Icons.close, color: color, size: 18),
            ),
          ],
        ],
      ),
    );
  }
}
