import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsSwitch extends StatelessWidget {
  const SentinelsSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.subtitle,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget toggle = Switch(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
    );

    if (label != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label!,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color
                          ?.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ],
            ),
          ),
          toggle,
        ],
      );
    }

    return toggle;
  }
}

class SentinelsCheckbox extends StatelessWidget {
  const SentinelsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget toggle = Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
    );

    if (label != null) {
      return InkWell(
        onTap: onChanged != null ? () => onChanged!(!(value ?? false)) : null,
        borderRadius: BorderRadius.circular(SentinelsRadius.sm),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: SentinelsSpacing.xs),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              toggle,
              const SizedBox(width: SentinelsSpacing.xs),
              Text(
                label!,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(width: SentinelsSpacing.md),
            ],
          ),
        ),
      );
    }

    return toggle;
  }
}
