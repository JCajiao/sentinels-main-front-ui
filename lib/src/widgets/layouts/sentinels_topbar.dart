import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsTopbar extends StatelessWidget implements PreferredSizeWidget {
  const SentinelsTopbar({
    super.key,
    required this.onMenuPressed,
    this.title,
    this.actions,
    this.searchWidget,
  });

  final VoidCallback onMenuPressed;
  final String? title;
  final List<Widget>? actions;
  final Widget? searchWidget;

  @override
  Widget build(BuildContext context) {
    final adminTheme = Theme.of(context).sentinelsAdminTheme;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: adminTheme.topBarBackground,
        border: Border(
          bottom: BorderSide(color: adminTheme.borderColor),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: adminTheme.topBarOnBackground),
            onPressed: onMenuPressed,
          ),
          if (title != null) ...[
            const SizedBox(width: SentinelsSpacing.md),
            Text(
              title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: adminTheme.topBarOnBackground,
              ),
            ),
          ],
          if (searchWidget != null) ...[
            const SizedBox(width: SentinelsSpacing.xl),
            Expanded(child: searchWidget!),
          ] else ...[
            const Spacer(),
          ],
          if (actions != null) ...actions!,
          const SizedBox(width: SentinelsSpacing.md),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
