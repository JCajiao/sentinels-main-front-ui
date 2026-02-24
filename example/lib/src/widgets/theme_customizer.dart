import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

import '../../main.dart'; // To access Provider.of(context)

class ThemeCustomizer extends StatelessWidget {
  const ThemeCustomizer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of(context);
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return Container(
      width: 300,
      color: adminTheme.contentBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(SentinelsSpacing.lg),
            color: theme.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Theme Customizer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(SentinelsSpacing.lg),
              children: [
                Text(
                  'Mode',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: SentinelsSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: SentinelsButton(
                        label: 'Light',
                        type: controller.themeMode == ThemeMode.light
                            ? SentinelsButtonType.primary
                            : SentinelsButtonType.outline,
                        icon: Icons.light_mode,
                        onPressed: () =>
                            controller.setThemeMode(ThemeMode.light),
                      ),
                    ),
                    const SizedBox(width: SentinelsSpacing.md),
                    Expanded(
                      child: SentinelsButton(
                        label: 'Dark',
                        type: controller.themeMode == ThemeMode.dark
                            ? SentinelsButtonType.primary
                            : SentinelsButtonType.outline,
                        icon: Icons.dark_mode,
                        onPressed: () =>
                            controller.setThemeMode(ThemeMode.dark),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SentinelsSpacing.xl),
                const Divider(),
                const SizedBox(height: SentinelsSpacing.xl),
                Text(
                  'Color Scheme',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: SentinelsSpacing.md),
                ...SentinelsPalette.values.map((palette) {
                  final isSelected = controller.palette == palette;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: SentinelsSpacing.sm),
                    child: InkWell(
                      onTap: () => controller.setPalette(palette),
                      borderRadius: BorderRadius.circular(SentinelsRadius.sm),
                      child: Container(
                        padding: const EdgeInsets.all(SentinelsSpacing.sm),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? theme.primaryColor
                                : adminTheme.borderColor,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(SentinelsRadius.sm),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: palette.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: SentinelsSpacing.md),
                            Expanded(
                              child: Text(
                                palette.name,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: theme.primaryColor, size: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
