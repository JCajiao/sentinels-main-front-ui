import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class Page404Screen extends StatelessWidget {
  const Page404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sentiment_dissatisfied,
                size: 120, color: Colors.grey),
            const SizedBox(height: SentinelsSpacing.xl),
            const Text('404',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const Text('Oops! Page not found.', style: TextStyle(fontSize: 20)),
            const SizedBox(height: SentinelsSpacing.xl),
            SentinelsButton(
              label: 'Return to Dashboard',
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ),
    );
  }
}

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SentinelsAuthLayout(
      title: 'Locked',
      subtitle: 'Please enter your password to unlock the screen!',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: SentinelsAvatar(initials: 'AD', radius: 40),
          ),
          const SizedBox(height: SentinelsSpacing.lg),
          const Center(
              child: Text('Admin User',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const SizedBox(height: SentinelsSpacing.xl),
          const SentinelsPasswordField(
            hintText: 'Enter password',
          ),
          const SizedBox(height: SentinelsSpacing.xl),
          SentinelsButton(
            label: 'Unlock',
            isFullWidth: true,
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}
