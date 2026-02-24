import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alerts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Basic Alerts',
          child: Column(
            children: [
              SentinelsAlert(
                  message: 'A simple primary alert—check it out!',
                  type: SentinelsBadgeType.primary,
                  onClose: () {}),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsAlert(
                  message: 'A simple secondary alert—check it out!',
                  type: SentinelsBadgeType.secondary,
                  onClose: () {}),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsAlert(
                  message: 'A simple success alert—check it out!',
                  type: SentinelsBadgeType.success,
                  onClose: () {}),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsAlert(
                  message: 'A simple danger alert—check it out!',
                  type: SentinelsBadgeType.danger,
                  onClose: () {}),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsAlert(
                  message: 'A simple warning alert—check it out!',
                  type: SentinelsBadgeType.warning,
                  onClose: () {}),
              const SizedBox(height: SentinelsSpacing.md),
              SentinelsAlert(
                  message: 'A simple info alert—check it out!',
                  type: SentinelsBadgeType.info,
                  onClose: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
