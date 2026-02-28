#!/bin/bash
# generate_icons.sh
#
# Generates launcher icons for Android, iOS, macOS, and Web from icon.png.
#
# Usage:
#   ./scripts/generate_icons.sh

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FLUTTER="/Users/pietroteruya/dev/flutter/bin/flutter"
DART="/Users/pietroteruya/dev/flutter/bin/dart"

cd "$ROOT"

echo "→ Installing / updating dependencies..."
"$FLUTTER" pub get

echo ""
echo "→ Compositing macOS icon (icon.png + #000000 background → icon_macos.png)..."
"$DART" run scripts/compose_macos_icon.dart

echo ""
echo "→ Generating launcher icons for all platforms..."
"$DART" run flutter_launcher_icons

echo ""
echo "→ Copying macOS icons to flavor-specific folders..."
# Copy generated icons to AppIcon-dev.appiconset
for png in "$ROOT/macos/Runner/Assets.xcassets/AppIcon.appiconset"/*.png; do
  if [[ -f "$png" ]]; then
    cp "$png" "$ROOT/macos/Runner/Assets.xcassets/AppIcon-dev.appiconset/$(basename "$png")"
    cp "$png" "$ROOT/macos/Runner/Assets.xcassets/AppIcon-stg.appiconset/$(basename "$png")"
  fi
done

echo ""
echo "✓ All icons generated successfully."
echo "  Platforms updated: Android, iOS, macOS (all flavors), Web"
