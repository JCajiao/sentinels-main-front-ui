# Component Theming Guide

## Theme Entry Points

- `SentinelsTheme.light()`
- `SentinelsTheme.dark()`
- `ThemeData.sentinelsAdminTheme` extension

## Core Components

- `AppBar`: neutral surface, low elevation.
- `Card`: bordered, rounded, dashboard-friendly density.
- `InputDecoration`: filled fields with clear focused border.
- `ElevatedButton`: primary emphasis with consistent radius.
- `Divider`: stable contrast in both light and dark.

## Admin Surfaces

Use the extension to keep sidebars/topbar/content synchronized:

```dart
final admin = Theme.of(context).sentinelsAdminTheme;

Container(color: admin.leftBarBackground);
```

## Semantic States

- Success: `SentinelsColors.success`
- Warning: `SentinelsColors.warning`
- Danger: `SentinelsColors.danger`
- Info: `SentinelsColors.info`
