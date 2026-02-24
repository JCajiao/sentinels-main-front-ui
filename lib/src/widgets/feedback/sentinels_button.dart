import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

enum SentinelsButtonType { primary, secondary, danger, outline, text }

class SentinelsButton extends StatelessWidget {
  const SentinelsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.type = SentinelsButtonType.primary,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final SentinelsButtonType type;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    Widget button;
    final theme = Theme.of(context);

    Color getPrimaryColor() {
      switch (type) {
        case SentinelsButtonType.secondary:
          return Theme.of(context).colorScheme.secondary;
        case SentinelsButtonType.danger:
          return SentinelsColors.danger;
        default:
          return Theme.of(context).primaryColor;
      }
    }

    final primaryColor = getPrimaryColor();

    switch (type) {
      case SentinelsButtonType.primary:
      case SentinelsButtonType.secondary:
      case SentinelsButtonType.danger:
        final style = ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: SentinelsElevation.none,
          padding: const EdgeInsets.symmetric(
            horizontal: SentinelsSpacing.lg,
            vertical: SentinelsSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          ),
        );

        if (icon != null) {
          button = ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 18),
            label: Text(label),
            style: style,
          );
        } else {
          button = ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Text(label),
          );
        }
        break;

      case SentinelsButtonType.outline:
        final style = OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor),
          padding: const EdgeInsets.symmetric(
            horizontal: SentinelsSpacing.lg,
            vertical: SentinelsSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          ),
        );

        if (icon != null) {
          button = OutlinedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 18),
            label: Text(label),
            style: style,
          );
        } else {
          button = OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: Text(label),
          );
        }
        break;

      case SentinelsButtonType.text:
        final style = TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: SentinelsSpacing.lg,
            vertical: SentinelsSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          ),
        );

        if (icon != null) {
          button = TextButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 18),
            label: Text(label),
            style: style,
          );
        } else {
          button = TextButton(
            onPressed: onPressed,
            style: style,
            child: Text(label),
          );
        }
        break;
    }

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
