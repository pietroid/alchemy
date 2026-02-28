# Why

Hard-coded color values in `alchimia_shell` duplicate the design tokens already defined in `alchimia_thematics`, making visual consistency fragile and changes error-prone.

# What

Resolve the ownership of shell-level color tokens without violating the architectural rule that **shell depends on engine only**.

Acceptance criteria:
- No raw `Color(0xFF...)` literals in shell widget files
- Shell colors remain consistent with the rest of the Alchimia design system
- The `alchimia_shell` package does **not** take a dependency on `alchimia_thematics`

Colors currently duplicated in shell:
| Value | AlchimiaColors name | Shell file |
|---|---|---|
| `0xFF0D0D0D` | `background` | `shell_view.dart` |
| `0xFF1A1A1A` | `panel` | `engine_canvas.dart`, `widget_menu_panel.dart` |
| `0xFF2A2A2A` | `border` | `engine_canvas.dart`, `widget_menu_panel.dart` |
| `0xFF888888` | `dimText` | `widget_menu_panel.dart` |
| `0xFFFFF1D1` | `cream` | `engine_canvas.dart` |
| `0xFF4A4A8A` | _(undefined)_ | `shell_view.dart` (BOX default color) |
| `0xFF4A4A4A` | _(undefined)_ | `widget_menu_panel.dart` |

# How

Two options:

## Option A — Shell reads colors from `Theme` (recommended)

`AlchimiaTheme.data` already maps `AlchimiaColors` into the `ColorScheme`. Shell widgets can read colors through `Theme.of(context)` without importing `alchimia_thematics` directly:

```dart
// Instead of const Color(0xFF1A1A1A):
Theme.of(context).colorScheme.surface  // maps to AlchimiaColors.panel

// Instead of const Color(0xFF2A2A2A):
Theme.of(context).colorScheme.outline  // maps to AlchimiaColors.border
```

Steps:
1. Extend `AlchimiaTheme.data` (in `alchimia_thematics`) to map all needed tokens into `ColorScheme` or a custom `ThemeExtension`.
2. Replace hard-coded colors in shell with `Theme.of(context)` lookups.
3. For colors not yet in the theme (e.g. `0xFF4A4A8A`, `0xFF4A4A4A`), add them as a `ThemeExtension<AlchimiaShellTheme>` defined in `alchimia_thematics` and read in shell via `Theme.of(context).extension<AlchimiaShellTheme>()`.

## Option B — Local color constants in shell

Add `packages/alchimia_shell/lib/src/tokens/shell_colors.dart` that mirrors the relevant subset of values. Duplication is explicit and confined. No theme lookup needed in widget code.

```dart
abstract final class _ShellColors {
  static const background = Color(0xFF0D0D0D);
  static const panel      = Color(0xFF1A1A1A);
  // ...
}
```

**Downside:** values are duplicated and a design change requires updating two files.

## Recommendation

Option A (ThemeExtension) is the right long-term approach and aligns with Flutter best practices. Option B is acceptable as a short-term measure if Option A adds too much ceremony for the current stage.
