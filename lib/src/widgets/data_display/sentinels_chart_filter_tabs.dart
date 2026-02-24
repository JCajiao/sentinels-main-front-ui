import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsChartFilterTabs extends StatefulWidget {
  const SentinelsChartFilterTabs({
    super.key,
    required this.tabs,
    required this.onTabChanged,
    this.initialIndex = 0,
  });

  final List<String> tabs;
  final ValueChanged<int> onTabChanged;
  final int initialIndex;

  @override
  State<SentinelsChartFilterTabs> createState() =>
      _SentinelsChartFilterTabsState();
}

class _SentinelsChartFilterTabsState extends State<SentinelsChartFilterTabs> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return Container(
      decoration: BoxDecoration(
        color: adminTheme.borderColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(SentinelsRadius.sm),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = index == _selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() => _selectedIndex = index);
              widget.onTabChanged(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SentinelsSpacing.md,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(SentinelsRadius.sm),
              ),
              child: Text(
                widget.tabs[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : adminTheme.contentOnBackground,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
