import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsSearchField extends StatelessWidget {
  const SentinelsSearchField({
    super.key,
    this.hintText = 'Search...',
    this.controller,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return Container(
      constraints: const BoxConstraints(maxWidth: 220),
      height: 40,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: adminTheme.topBarOnBackground,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: SentinelsSpacing.lg,
            vertical: SentinelsSpacing.sm,
          ),
          isDense: true,
          filled: true,
          fillColor: adminTheme.topBarOnBackground.withValues(alpha: 0.1),
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: adminTheme.topBarOnBackground.withValues(alpha: 0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 16,
            color: adminTheme.topBarOnBackground.withValues(alpha: 0.5),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
        ),
      ),
    );
  }
}
