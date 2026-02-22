import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

void main() {
  runApp(const SentinelsDemoApp());
}

class SentinelsDemoApp extends StatefulWidget {
  const SentinelsDemoApp({super.key});

  @override
  State<SentinelsDemoApp> createState() => _SentinelsDemoAppState();
}

class _SentinelsDemoAppState extends State<SentinelsDemoApp> {
  final SentinelsThemeController controller = SentinelsThemeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: SentinelsTheme.light(seedColor: controller.seedColor),
          darkTheme: SentinelsTheme.dark(seedColor: controller.seedColor),
          themeMode: controller.themeMode,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Sentinels Main Front UI'),
              actions: <Widget>[
                IconButton(
                  onPressed: controller.toggleThemeMode,
                  icon: const Icon(Icons.brightness_6_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(SentinelsSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Reusable theme baseline for Sentinels projects.'),
                  const SizedBox(height: SentinelsSpacing.lg),
                  Wrap(
                    spacing: SentinelsSpacing.sm,
                    runSpacing: SentinelsSpacing.sm,
                    children: <Widget>[
                      _colorChip('Primary', SentinelsColors.primary),
                      _colorChip('Secondary', SentinelsColors.secondary),
                      _colorChip('Success', SentinelsColors.success),
                      _colorChip('Warning', SentinelsColors.warning),
                      _colorChip('Danger', SentinelsColors.danger),
                    ],
                  ),
                  const SizedBox(height: SentinelsSpacing.xl),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Primary action'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _colorChip(String label, Color color) {
    return Chip(
      avatar: CircleAvatar(backgroundColor: color),
      label: Text(label),
      side: BorderSide.none,
    );
  }
}
