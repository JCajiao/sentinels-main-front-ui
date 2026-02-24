import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class ModalsScreen extends StatelessWidget {
  const ModalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Modals',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Dialog Variants',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            children: [
              SentinelsButton(
                label: 'Open Confirmation',
                onPressed: () {
                  SentinelsModal.show(
                    context: context,
                    title: 'Confirm Action',
                    content: const Text(
                      'Do you want to proceed with this operation?',
                    ),
                  );
                },
              ),
              SentinelsButton(
                label: 'Open Destructive',
                type: SentinelsButtonType.danger,
                onPressed: () {
                  SentinelsModal.show(
                    context: context,
                    title: 'Delete Record',
                    content: const Text(
                      'This action cannot be undone. Continue?',
                    ),
                    isDestructive: true,
                    confirmLabel: 'Delete',
                  );
                },
              ),
              SentinelsButton(
                label: 'Bottom Sheet',
                type: SentinelsButtonType.outline,
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(SentinelsRadius.lg),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(SentinelsSpacing.xl),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Quick Actions',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: SentinelsSpacing.lg),
                            ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                            ListTile(
                              leading: const Icon(Icons.share),
                              title: const Text('Share'),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.delete_outline,
                                color: SentinelsColors.danger,
                              ),
                              title: const Text('Delete'),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    },
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
