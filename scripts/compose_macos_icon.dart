// compose_macos_icon.dart
//
// Composites icon.png onto a solid #3B2918 background and saves the result
// as icon_macos.png at 1024×1024 px — ready for flutter_launcher_icons macOS.
//
// Run from the project root:
//   dart run scripts/compose_macos_icon.dart
//
// The `image` package is a transitive dependency of flutter_launcher_icons
// and is therefore available without any extra pubspec entries.

import 'dart:io';

import 'package:image/image.dart';

void main() {
  const outputSize = 1024;

  // Load source icon
  final iconBytes = File('icon.png').readAsBytesSync();
  final icon = decodePng(iconBytes);
  if (icon == null) {
    stderr.writeln('✗ Could not decode icon.png');
    exitCode = 1;
    return;
  }

  // Create opaque background filled with #000000
  final bg = Image(width: outputSize, height: outputSize, numChannels: 4);
  fill(bg, color: ColorRgb8(0x00, 0x00, 0x00));

  // Resize the source icon to fill the canvas
  final resized = copyResize(
    icon,
    width: outputSize,
    height: outputSize,
    interpolation: Interpolation.cubic,
  );

  // Composite the (possibly transparent) icon over the background
  compositeImage(bg, resized);

  // Write output
  File('icon_macos.png').writeAsBytesSync(encodePng(bg));
  print(
    '✓ icon_macos.png created '
    '(${outputSize}×${outputSize} px, background #3B2918)',
  );
}
