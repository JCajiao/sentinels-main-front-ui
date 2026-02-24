import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsCard extends StatelessWidget {
  const SentinelsCard({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.padding = const EdgeInsets.all(SentinelsSpacing.lg),
  });

  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || actions != null) ...[
            Padding(
              padding: const EdgeInsets.only(
                left: SentinelsSpacing.lg,
                right: SentinelsSpacing.lg,
                top: SentinelsSpacing.lg,
                bottom: SentinelsSpacing.md,
              ),
              child: Row(
                children: [
                  if (title != null) ...[
                    Expanded(
                      child: Text(
                        title!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                  if (actions != null) ...actions!,
                ],
              ),
            ),
            const Divider(height: 1),
          ],
          Padding(
            padding: padding,
            child: child,
          ),
        ],
      ),
    );
  }
}
