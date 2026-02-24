import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pricing Plans',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 900;
            final cards = [
              _buildPricingCard(context, 'Basic', '9', false),
              _buildPricingCard(context, 'Pro', '29', true),
              _buildPricingCard(context, 'Enterprise', '99', false),
            ];

            if (isDesktop) {
              return Row(
                children: cards
                    .map((c) => Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(SentinelsSpacing.sm),
                            child: c)))
                    .toList(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cards
                  .map((c) => Padding(
                      padding:
                          const EdgeInsets.only(bottom: SentinelsSpacing.lg),
                      child: c))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPricingCard(
      BuildContext context, String title, String price, bool isPopular) {
    return SentinelsCard(
      child: Column(
        children: [
          if (isPopular)
            const SentinelsBadge(
                label: 'MOST POPULAR', type: SentinelsBadgeType.success)
          else
            const SizedBox(height: 20),
          const SizedBox(height: SentinelsSpacing.lg),
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: SentinelsSpacing.md),
          Text('\$$price/mo',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
          const SizedBox(height: SentinelsSpacing.xl),
          const ListTile(
              leading: Icon(Icons.check, color: SentinelsColors.success),
              title: Text('Feature 1 included')),
          const ListTile(
              leading: Icon(Icons.check, color: SentinelsColors.success),
              title: Text('Feature 2 included')),
          const ListTile(
              leading: Icon(Icons.close, color: SentinelsColors.danger),
              title: Text('Feature 3 not included')),
          const SizedBox(height: SentinelsSpacing.xl),
          SentinelsButton(
            label: 'Choose Plan',
            type: isPopular
                ? SentinelsButtonType.primary
                : SentinelsButtonType.outline,
            isFullWidth: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
