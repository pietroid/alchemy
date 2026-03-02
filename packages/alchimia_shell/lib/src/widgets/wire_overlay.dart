import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:alchimia_shell/src/painters/wire_painter.dart';
import 'package:flutter/material.dart';

/// A [CustomPaint] widget that draws bezier wires from child output ports
/// to main widget input ports, overlaid on the circuit table.
class WireOverlay extends StatelessWidget {
  const WireOverlay({required this.placedWidgets, super.key});

  final List<PlacedWidget> placedWidgets;

  @override
  Widget build(BuildContext context) {
    final wireColor =
        Theme.of(context).colorScheme.tertiaryContainer;
    return CustomPaint(
      painter: WirePainter(
        placedWidgets: placedWidgets,
        wireColor: wireColor,
      ),
    );
  }
}
