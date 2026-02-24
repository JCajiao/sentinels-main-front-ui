import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsRadio<T> extends StatelessWidget {
  const SentinelsRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: theme.primaryColor,
    );

    if (label != null) {
      return InkWell(
        onTap: onChanged != null ? () => onChanged!(value) : null,
        borderRadius: BorderRadius.circular(SentinelsRadius.sm),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: SentinelsSpacing.xs),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              radio,
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

    return radio;
  }
}
