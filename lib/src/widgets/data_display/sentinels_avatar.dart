import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsAvatar extends StatelessWidget {
  const SentinelsAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.radius = 20,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String? imageUrl;
  final String? initials;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ??
        Theme.of(context).primaryColor.withValues(alpha: 0.1);
    final fg = foregroundColor ?? Theme.of(context).primaryColor;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl!),
        backgroundColor: bg,
      );
    }

    if (initials != null && initials!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: bg,
        foregroundColor: fg,
        child: Text(
          initials!.toUpperCase(),
          style: theme.textTheme.titleMedium?.copyWith(
            color: fg,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: bg,
      foregroundColor: fg,
      child: Icon(Icons.person, color: fg),
    );
  }
}
