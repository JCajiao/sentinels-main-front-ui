import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Timeline',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          child: Column(
            children: List.generate(5, (index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (index < 4)
                        Container(
                          width: 2,
                          height: 50,
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.3),
                        ),
                    ],
                  ),
                  const SizedBox(width: SentinelsSpacing.md),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: SentinelsSpacing.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Event Title \$index',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: SentinelsSpacing.xs),
                          Text(
                              'This is a description for the event timeline entry number \$index. It provides context.'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
