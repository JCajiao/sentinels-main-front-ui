import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class BreadcrumbScreen extends StatelessWidget {
  const BreadcrumbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Breadcrumbs',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Breadcrumb Variations',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SentinelsBreadcrumb(
                items: const [
                  SentinelsBreadcrumbItem(label: 'Home', route: '/'),
                ],
                onItemTapped: (_) {},
              ),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsBreadcrumb(
                items: const [
                  SentinelsBreadcrumbItem(label: 'Home', route: '/'),
                  SentinelsBreadcrumbItem(label: 'Library', route: '/library'),
                ],
                onItemTapped: (_) {},
              ),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsBreadcrumb(
                items: const [
                  SentinelsBreadcrumbItem(label: 'Home', route: '/'),
                  SentinelsBreadcrumbItem(label: 'Library', route: '/library'),
                  SentinelsBreadcrumbItem(
                      label: 'Data', route: '/library/data'),
                ],
                onItemTapped: (_) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
