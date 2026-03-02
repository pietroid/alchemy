import 'package:alchimia_shell/src/layout_constants.dart';
import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:flutter/material.dart';

/// [CustomPainter] that draws cubic bezier wires connecting child component
/// output ports to the main widget input ports.
///
/// Port positions are computed geometrically from stored offsets and layout
/// constants, without requiring [GlobalKey]s.
class WirePainter extends CustomPainter {
  const WirePainter({
    required this.placedWidgets,
    required this.wireColor,
  });

  final List<PlacedWidget> placedWidgets;
  final Color wireColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = wireColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < placedWidgets.length; i++) {
      final placed = placedWidgets[i];
      _drawWire(canvas, paint, placed, i);
    }
  }

  void _drawWire(
    Canvas canvas,
    Paint paint,
    PlacedWidget placed,
    int inputIndex,
  ) {
    // Child output port: right side of the component body, vertically centered
    // in the header area.
    final from = Offset(
      placed.offset.dx + kCircuitComponentWidth + kCircuitPortSize / 2,
      placed.offset.dy + kCircuitHeaderHeight / 2,
    );

    // Main input port: left side of the main widget, one port per child.
    final to = Offset(
      kCircuitMainLeft - kCircuitPortSize / 2,
      kCircuitMainTop +
          kCircuitHeaderHeight +
          inputIndex * kCircuitPortRowHeight +
          kCircuitPortRowHeight / 2,
    );

    // Horizontal bezier control point distance proportional to x separation.
    final dx = (to.dx - from.dx).abs() * 0.5;

    final path = Path()
      ..moveTo(from.dx, from.dy)
      ..cubicTo(
        from.dx + dx,
        from.dy,
        to.dx - dx,
        to.dy,
        to.dx,
        to.dy,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WirePainter oldDelegate) =>
      oldDelegate.placedWidgets != placedWidgets ||
      oldDelegate.wireColor != wireColor;
}
