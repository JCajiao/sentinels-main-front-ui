import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Avatars',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        const SentinelsCard(
          title: 'Avatar Initials',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SentinelsAvatar(initials: 'AB', radius: 16),
              SentinelsAvatar(initials: 'CD', radius: 24),
              SentinelsAvatar(initials: 'EF', radius: 32),
              SentinelsAvatar(initials: 'GH', radius: 48),
            ],
          ),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Avatar Colors',
          child: Wrap(
            spacing: SentinelsSpacing.md,
            runSpacing: SentinelsSpacing.md,
            children: [
              SentinelsAvatar(
                initials: 'P',
                backgroundColor:
                    Theme.of(context).primaryColor.withValues(alpha: 0.1),
                foregroundColor: Theme.of(context).primaryColor,
              ),
              SentinelsAvatar(
                initials: 'S',
                backgroundColor: SentinelsColors.success.withValues(alpha: 0.1),
                foregroundColor: SentinelsColors.success,
              ),
              SentinelsAvatar(
                initials: 'W',
                backgroundColor: SentinelsColors.warning.withValues(alpha: 0.1),
                foregroundColor: SentinelsColors.warning,
              ),
              SentinelsAvatar(
                initials: 'D',
                backgroundColor: SentinelsColors.danger.withValues(alpha: 0.1),
                foregroundColor: SentinelsColors.danger,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
