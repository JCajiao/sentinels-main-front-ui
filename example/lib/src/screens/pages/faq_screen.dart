import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Frequently Asked Questions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _buildFaqItem(context, 'What is Sentinels UI?',
                  'Sentinels UI is a comprehensive Flutter design system based on Morvin and Upzet.'),
              const Divider(height: 1),
              _buildFaqItem(context, 'How do I use it with Django?',
                  'You can build your frontend in Flutter and consume your Django REST Framework APIs as usual.'),
              const Divider(height: 1),
              _buildFaqItem(context, 'Does it support Dark Mode?',
                  'Yes! It has full support for Light and Dark modes with multiple color palettes.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFaqItem(BuildContext context, String question, String answer) {
    return ExpansionTile(
      title:
          Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
      childrenPadding: const EdgeInsets.only(
          left: SentinelsSpacing.lg,
          right: SentinelsSpacing.lg,
          bottom: SentinelsSpacing.lg),
      expandedAlignment: Alignment.centerLeft,
      children: [
        Text(answer),
      ],
    );
  }
}
