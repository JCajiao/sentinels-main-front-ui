import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

import 'sentinels_sidebar.dart';
import 'sentinels_sidebar_item.dart';
import 'sentinels_topbar.dart';

class SentinelsAdminScaffold extends StatefulWidget {
  const SentinelsAdminScaffold({
    super.key,
    required this.body,
    required this.sidebarItems,
    this.logoExpandedLight,
    this.logoExpandedDark,
    this.logoCollapsedLight,
    this.logoCollapsedDark,
    this.topbarActions,
    this.topbarSearch,
    this.title,
    this.isSidebarCollapsible = true,
    this.onSidebarItemTapped,
    this.currentRoute,
    this.endDrawer,
    this.sidebarProfileHeader,
  });

  final Widget body;
  final List<SentinelsSidebarItem> sidebarItems;
  final Widget? logoExpandedLight;
  final Widget? logoExpandedDark;
  final Widget? logoCollapsedLight;
  final Widget? logoCollapsedDark;
  final List<Widget>? topbarActions;
  final Widget? topbarSearch;
  final String? title;
  final bool isSidebarCollapsible;
  final ValueChanged<String>? onSidebarItemTapped;
  final String? currentRoute;
  final Widget? endDrawer;
  final Widget? sidebarProfileHeader;

  @override
  State<SentinelsAdminScaffold> createState() => _SentinelsAdminScaffoldState();
}

class _SentinelsAdminScaffoldState extends State<SentinelsAdminScaffold> {
  bool _isSidebarCollapsed = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarCollapsed = !_isSidebarCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 992;
    final adminTheme = Theme.of(context).sentinelsAdminTheme;

    final sidebar = SentinelsSidebar(
      items: widget.sidebarItems,
      isCollapsed: isDesktop ? _isSidebarCollapsed : false,
      logoExpandedLight: widget.logoExpandedLight,
      logoExpandedDark: widget.logoExpandedDark,
      logoCollapsedLight: widget.logoCollapsedLight,
      logoCollapsedDark: widget.logoCollapsedDark,
      onItemTapped: widget.onSidebarItemTapped,
      currentRoute: widget.currentRoute,
      profileHeader: widget.sidebarProfileHeader,
    );

    return Scaffold(
      backgroundColor: adminTheme.contentBackground,
      drawer: isDesktop ? null : sidebar,
      endDrawer: widget.endDrawer,
      appBar: isDesktop
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Builder(
                builder: (BuildContext context) {
                  return SentinelsTopbar(
                    onMenuPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    title: widget.title,
                    actions: widget.topbarActions,
                    searchWidget: widget.topbarSearch,
                  );
                },
              ),
            ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) ...[
            sidebar,
          ],
          Expanded(
            child: Column(
              children: [
                if (isDesktop) ...[
                  SentinelsTopbar(
                    onMenuPressed:
                        widget.isSidebarCollapsible ? _toggleSidebar : () {},
                    title: widget.title,
                    actions: widget.topbarActions,
                    searchWidget: widget.topbarSearch,
                  ),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(SentinelsSpacing.xl),
                      child: widget.body,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
