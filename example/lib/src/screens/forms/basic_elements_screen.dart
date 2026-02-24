import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class BasicElementsScreen extends StatelessWidget {
  const BasicElementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Basic Form Elements',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Textual Inputs',
          child: Column(
            children: [
              const SentinelsTextField(
                  label: 'Standard Input', hintText: 'Type something...'),
              const SizedBox(height: SentinelsSpacing.lg),
              const SentinelsTextField(
                  label: 'With Icon',
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search)),
              const SizedBox(height: SentinelsSpacing.lg),
              const SentinelsTextField(
                  label: 'Password',
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock)),
              const SizedBox(height: SentinelsSpacing.lg),
              SentinelsDropdown<String>(
                label: 'Select Option',
                value: '1',
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Option 1')),
                  DropdownMenuItem(value: '2', child: Text('Option 2')),
                ],
                onChanged: (v) {},
              ),
            ],
          ),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Toggles & Checks',
          child: Column(
            children: [
              SentinelsSwitch(
                  label: 'Enable Notifications',
                  value: true,
                  onChanged: (v) {}),
              SentinelsSwitch(
                  label: 'Dark Mode Default',
                  subtitle: 'Turn this on to default to dark mode',
                  value: false,
                  onChanged: (v) {}),
              const Divider(),
              SentinelsCheckbox(
                  label: 'I accept the terms and conditions',
                  value: true,
                  onChanged: (v) {}),
              SentinelsCheckbox(
                  label: 'Subscribe to newsletter',
                  value: false,
                  onChanged: (v) {}),
            ],
          ),
        ),
      ],
    );
  }
}
