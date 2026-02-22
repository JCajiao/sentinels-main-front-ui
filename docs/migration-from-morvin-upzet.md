# Migration Notes (Morvin + Upzet)

## Scope

This package does not clone reference templates. It consolidates their theming approach into a clean, reusable baseline.

## Mapping

| Legacy | Sentinels Main Front UI |
|---|---|
| `AppTheme.lightTheme/darkTheme` | `SentinelsTheme.light()/dark()` |
| `AdminTheme` color groups | `SentinelsAdminTheme` extension |
| Mixed constants in helper files | Token files under `tokens/` |
| Template-level customizer logic | `SentinelsThemeController` |

## Behavioral Differences

- Keeps Morvin visual direction as default primary identity.
- Uses Upzet-inspired balancing for semantic colors and dark surfaces.
- Removes routing, localization, storage, and app-shell coupling from theme package.
