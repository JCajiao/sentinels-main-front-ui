# Theme Governance

## Purpose

Guarantee visual consistency across Sentinels projects by maintaining one authoritative theme package.

## Rules

- No one-off color values in product apps when token exists.
- Add new tokens before adding component overrides.
- Keep light and dark parity for each component theme addition.
- Use semantic colors (`success`, `warning`, `danger`, `info`) for state UI.

## Versioning

- `MAJOR`: breaking token or API changes.
- `MINOR`: new backwards-compatible tokens/components.
- `PATCH`: bug fixes and non-breaking refinements.

## Change Process

1. Open issue with rationale and screenshots.
2. Propose token/component update.
3. Update docs and changelog in same PR.
4. Require review from design + engineering owner.
