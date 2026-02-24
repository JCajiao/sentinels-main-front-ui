import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';
import 'sentinels_sidebar_item.dart';

class SentinelsSidebar extends StatefulWidget {
  const SentinelsSidebar({
    super.key,
    required this.items,
    this.isCollapsed = false,
    this.logoExpandedLight,
    this.logoExpandedDark,
    this.logoCollapsedLight,
    this.logoCollapsedDark,
    this.onItemTapped,
    this.currentRoute,
    this.profileHeader,
  });

  final List<SentinelsSidebarItem> items;
  final bool isCollapsed;
  final Widget? logoExpandedLight;
  final Widget? logoExpandedDark;
  final Widget? logoCollapsedLight;
  final Widget? logoCollapsedDark;
  final ValueChanged<String>? onItemTapped;
  final String? currentRoute;
  final Widget? profileHeader;

  @override
  State<SentinelsSidebar> createState() => _SentinelsSidebarState();
}

class _SentinelsSidebarState extends State<SentinelsSidebar> {
  late List<bool> _expandedStates;

  @override
  void initState() {
    super.initState();
    _expandedStates = widget.items.map((i) => i.isExpanded).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;
    final isDark = theme.brightness == Brightness.dark;

    Widget getLogo() {
      if (widget.isCollapsed) {
        if (isDark) {
          return widget.logoCollapsedDark ??
              Image.asset('assets/logos/logo-social-white.png',
                  package: 'sentinels_main_front_ui', height: 32);
        } else {
          return widget.logoCollapsedLight ??
              Image.asset('assets/logos/logo-social-black.png',
                  package: 'sentinels_main_front_ui', height: 32);
        }
      } else {
        if (isDark) {
          return widget.logoExpandedDark ??
              Image.asset('assets/logos/sentinels-white-no-tagline-hub.png',
                  package: 'sentinels_main_front_ui', height: 32);
        } else {
          return widget.logoExpandedLight ??
              Image.asset('assets/logos/sentinels-no-tagline-hub.png',
                  package: 'sentinels_main_front_ui', height: 32);
        }
      }
    }

    return Container(
      width: widget.isCollapsed ? 80 : 250,
      color: adminTheme.leftBarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: adminTheme.borderColor),
              ),
            ),
            child: getLogo(),
          ),
          if (widget.profileHeader != null && !widget.isCollapsed) ...[
            Padding(
              padding: const EdgeInsets.all(SentinelsSpacing.lg),
              child: widget.profileHeader!,
            ),
            Divider(color: adminTheme.borderColor, height: 1),
          ],
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: SentinelsSpacing.md),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return _buildMenuItem(
                  item,
                  index,
                  adminTheme,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      SentinelsSidebarItem item, int index, SentinelsAdminTheme adminTheme) {
    if (item.isSectionTitle && !widget.isCollapsed) {
      return Padding(
        padding: const EdgeInsets.only(
          left: SentinelsSpacing.lg,
          right: SentinelsSpacing.lg,
          top: SentinelsSpacing.xl,
          bottom: SentinelsSpacing.sm,
        ),
        child: Text(
          item.title.toUpperCase(),
          style: TextStyle(
            color: adminTheme.leftBarOnBackground.withValues(alpha: 0.5),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      );
    } else if (item.isSectionTitle && widget.isCollapsed) {
      return const SizedBox(height: SentinelsSpacing.md);
    }

    final bool isSelected =
        widget.currentRoute != null && item.route == widget.currentRoute;
    final Color itemColor = isSelected
        ? Theme.of(context).primaryColor
        : adminTheme.leftBarOnBackground;
    final TextStyle textStyle = TextStyle(
      color: itemColor,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      fontSize: 14,
    );

    if (widget.isCollapsed) {
      return InkWell(
        onTap: () {
          if (item.route != null && widget.onItemTapped != null) {
            widget.onItemTapped!(item.route!);
          }
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: item.icon != null
              ? Icon(item.icon, color: itemColor, size: 24)
              : Text(item.title[0], style: textStyle),
        ),
      );
    }

    if (!item.hasSubItems) {
      return ListTile(
        leading: item.icon != null
            ? Icon(item.icon, color: itemColor, size: 22)
            : const SizedBox(width: 22),
        title: Text(item.title, style: textStyle),
        selected: isSelected,
        onTap: () {
          if (item.route != null && widget.onItemTapped != null) {
            widget.onItemTapped!(item.route!);
          }
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: SentinelsSpacing.lg),
        horizontalTitleGap: 0,
        minLeadingWidth: 32,
      );
    }

    return ExpansionTile(
      leading: item.icon != null
          ? Icon(item.icon, color: itemColor, size: 22)
          : const SizedBox(width: 22),
      title: Text(item.title, style: textStyle),
      initiallyExpanded: _expandedStates[index],
      onExpansionChanged: (expanded) {
        setState(() {
          _expandedStates[index] = expanded;
        });
      },
      iconColor: itemColor,
      collapsedIconColor: adminTheme.leftBarOnBackground,
      tilePadding: const EdgeInsets.symmetric(horizontal: SentinelsSpacing.lg),
      childrenPadding: const EdgeInsets.only(left: SentinelsSpacing.xl),
      children: item.subItems.map((subItem) {
        final bool isSubSelected =
            widget.currentRoute != null && subItem.route == widget.currentRoute;
        final Color subItemColor = isSubSelected
            ? Theme.of(context).primaryColor
            : adminTheme.leftBarOnBackground.withOpacity(0.8);
        return ListTile(
          title: Text(
            subItem.title,
            style: TextStyle(
              color: subItemColor,
              fontSize: 13,
              fontWeight: isSubSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          onTap: () {
            if (subItem.route != null && widget.onItemTapped != null) {
              widget.onItemTapped!(subItem.route!);
            }
          },
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: SentinelsSpacing.md),
        );
      }).toList(),
    );
  }
}
