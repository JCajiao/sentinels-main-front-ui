import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Badges',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        const SentinelsCard(
          title: 'Standard Badges',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            children: [
              SentinelsBadge(label: 'Primary'),
              SentinelsBadge(
                  label: 'Secondary', type: SentinelsBadgeType.secondary),
              SentinelsBadge(
                  label: 'Success', type: SentinelsBadgeType.success),
              SentinelsBadge(
                  label: 'Warning', type: SentinelsBadgeType.warning),
              SentinelsBadge(label: 'Danger', type: SentinelsBadgeType.danger),
              SentinelsBadge(label: 'Info', type: SentinelsBadgeType.info),
            ],
          ),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        const SentinelsCard(
          title: 'Soft / Light Badges',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            children: [
              SentinelsBadge(label: 'Primary Soft', isSoft: true),
              SentinelsBadge(
                  label: 'Secondary Soft',
                  type: SentinelsBadgeType.secondary,
                  isSoft: true),
              SentinelsBadge(
                  label: 'Success Soft',
                  type: SentinelsBadgeType.success,
                  isSoft: true),
              SentinelsBadge(
                  label: 'Warning Soft',
                  type: SentinelsBadgeType.warning,
                  isSoft: true),
              SentinelsBadge(
                  label: 'Danger Soft',
                  type: SentinelsBadgeType.danger,
                  isSoft: true),
              SentinelsBadge(
                  label: 'Info Soft',
                  type: SentinelsBadgeType.info,
                  isSoft: true),
            ],
          ),
        ),
      ],
    );
  }
}
