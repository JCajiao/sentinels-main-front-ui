import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsAccordion extends StatelessWidget {
  const SentinelsAccordion({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
  });

  final String title;
  final Widget content;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return Container(
      decoration: BoxDecoration(
        color: adminTheme.contentBackground,
        border: Border.all(color: adminTheme.borderColor),
        borderRadius: BorderRadius.circular(SentinelsRadius.sm),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: adminTheme.contentOnBackground,
          ),
        ),
        initiallyExpanded: initiallyExpanded,
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        childrenPadding:
            const EdgeInsets.all(SentinelsSpacing.lg).copyWith(top: 0),
        expandedAlignment: Alignment.centerLeft,
        children: [
          content,
        ],
      ),
    );
  }
}
