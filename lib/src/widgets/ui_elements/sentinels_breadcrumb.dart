import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsBreadcrumbItem {
  const SentinelsBreadcrumbItem({
    required this.label,
    this.route,
  });

  final String label;
  final String? route;
}

class SentinelsBreadcrumb extends StatelessWidget {
  const SentinelsBreadcrumb({
    super.key,
    required this.items,
    this.onItemTapped,
  });

  final List<SentinelsBreadcrumbItem> items;
  final ValueChanged<String>? onItemTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SentinelsSpacing.xs),
            child: Icon(
              Icons.chevron_right,
              size: 16,
              color: adminTheme.contentOnBackground.withValues(alpha: 0.5),
            ),
          );
        }

        final itemIndex = index ~/ 2;
        final item = items[itemIndex];
        final isLast = itemIndex == items.length - 1;

        if (isLast || item.route == null) {
          return Text(
            item.label,
            style: TextStyle(
              color: adminTheme.contentOnBackground.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500,
            ),
          );
        }

        return InkWell(
          onTap: onItemTapped != null ? () => onItemTapped!(item.route!) : null,
          child: Text(
            item.label,
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }),
    );
  }
}
