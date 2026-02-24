import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SentinelsBreadcrumb(
          items: [
            SentinelsBreadcrumbItem(label: 'Home', route: '/'),
            SentinelsBreadcrumbItem(label: 'UI Elements'),
            SentinelsBreadcrumbItem(label: 'Cards'),
          ],
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        const Text('Cards & Content',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SentinelsCard(
                title: 'Basic Card',
                child: const Text(
                    'This is a basic card implementation with a title and default padding. It uses the global theme settings for borders and backgrounds.'),
              ),
            ),
            const SizedBox(width: SentinelsSpacing.xl),
            Expanded(
              child: SentinelsCard(
                title: 'Card with Actions',
                actions: [
                  SentinelsButton(
                      label: 'Edit',
                      type: SentinelsButtonType.text,
                      onPressed: () {}),
                ],
                child: const Text(
                    'You can inject actions into the top right corner of the card header effortlessly.'),
              ),
            ),
          ],
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        Row(
          children: [
            Expanded(
              child: SentinelsAccordion(
                title: 'Collapsible Section 1',
                initiallyExpanded: true,
                content: const Text(
                    'This is the content inside an accordion. Useful for FAQs or grouping heavy settings.'),
              ),
            ),
            const SizedBox(width: SentinelsSpacing.xl),
            Expanded(
              child: SentinelsAccordion(
                title: 'Collapsible Section 2',
                content: const Text('More content hidden by default.'),
              ),
            ),
          ],
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Skeleton Loaders',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Used to display loading states before data arrives:'),
              const SizedBox(height: SentinelsSpacing.lg),
              Row(
                children: [
                  const SentinelsSkeleton(
                      width: 48, height: 48, borderRadius: 24),
                  const SizedBox(width: SentinelsSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SentinelsSkeleton(width: 200, height: 16),
                        const SizedBox(height: SentinelsSpacing.sm),
                        const SentinelsSkeleton(height: 12),
                        const SizedBox(height: SentinelsSpacing.xs),
                        const SentinelsSkeleton(width: 150, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Toasts & Snackbars',
          child: Row(
            children: [
              SentinelsButton(
                label: 'Show Success Toast',
                type: SentinelsButtonType.secondary,
                onPressed: () {
                  SentinelsToast.show(
                    context: context,
                    message: 'Record saved successfully!',
                    type: SentinelsBadgeType.success,
                  );
                },
              ),
              const SizedBox(width: SentinelsSpacing.md),
              SentinelsButton(
                label: 'Show Error Toast',
                type: SentinelsButtonType.danger,
                onPressed: () {
                  SentinelsToast.show(
                    context: context,
                    message: 'Failed to delete the record.',
                    type: SentinelsBadgeType.danger,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
