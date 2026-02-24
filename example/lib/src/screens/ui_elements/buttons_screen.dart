import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Buttons',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Button Variants',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            children: [
              SentinelsButton(label: 'Primary', onPressed: () {}),
              SentinelsButton(
                label: 'Secondary',
                type: SentinelsButtonType.secondary,
                onPressed: () {},
              ),
              SentinelsButton(
                label: 'Danger',
                type: SentinelsButtonType.danger,
                onPressed: () {},
              ),
              SentinelsButton(
                label: 'Outline',
                type: SentinelsButtonType.outline,
                onPressed: () {},
              ),
              SentinelsButton(
                label: 'Text',
                type: SentinelsButtonType.text,
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Buttons with Icons',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            children: [
              SentinelsButton(
                label: 'Create',
                icon: Icons.add,
                onPressed: () {},
              ),
              SentinelsButton(
                label: 'Download',
                icon: Icons.download,
                type: SentinelsButtonType.secondary,
                onPressed: () {},
              ),
              SentinelsButton(
                label: 'Delete',
                icon: Icons.delete_outline,
                type: SentinelsButtonType.danger,
                onPressed: () {},
              ),
              SentinelsButton(
                label: 'Share',
                icon: Icons.share,
                type: SentinelsButtonType.outline,
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Block and Disabled',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SentinelsButton(
                label: 'Full Width Action',
                isFullWidth: true,
                onPressed: () {},
              ),
              const SizedBox(height: SentinelsSpacing.md),
              const SentinelsButton(
                label: 'Disabled',
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
