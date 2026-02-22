# Sentinels Main Front UI

Reusable Flutter theme package for Sentinels products.

This package is built with:
- Primary reference: `Morvin`
- Secondary reference: `Upzet`

It is intended to be the shared visual baseline for Sentinels frontends (including apps backed by Django APIs).

## Package Goals

- Single source of truth for colors, typography, spacing, radius, and elevations.
- Stable `ThemeData` for light and dark modes.
- Admin-ready theme extension for sidebars/topbar/content surfaces.
- Easy integration in any Flutter app.

## Install

```yaml
dependencies:
  sentinels_main_front_ui:
    git:
      url: git@github.com:JCajiao/sentinels-main-front-ui.git
      ref: main
```

## Quick Usage

```dart
import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SentinelsThemeController controller = SentinelsThemeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => MaterialApp(
        theme: SentinelsTheme.light(seedColor: controller.seedColor),
        darkTheme: SentinelsTheme.dark(seedColor: controller.seedColor),
        themeMode: controller.themeMode,
        home: const Placeholder(),
      ),
    );
  }
}
```

## Docs

- `docs/design-tokens.md`
- `docs/components-theming.md`
- `docs/migration-from-morvin-upzet.md`
- `docs/governance.md`

## Development

```bash
flutter pub get
flutter test
```
