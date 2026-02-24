import 'package:flutter/material.dart';

class SentinelsSidebarItem {
  const SentinelsSidebarItem({
    required this.title,
    this.icon,
    this.route,
    this.subItems = const [],
    this.isExpanded = false,
    this.isSectionTitle = false,
  });

  final String title;
  final IconData? icon;
  final String? route;
  final List<SentinelsSidebarItem> subItems;
  final bool isExpanded;
  final bool isSectionTitle;

  bool get hasSubItems => subItems.isNotEmpty;
}
