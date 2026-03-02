import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:flutter/material.dart';

// Layout constants matching circuit component dimensions.
const double _kComponentWidth = 220;
const double _kHeaderHeight = 28;
const double _kPortSize = 8;
const double _kPortRowHeight = 24;
const double _kMainLeft = 60;
const double _kMainTop = 80;

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
      placed.offset.dx + _kComponentWidth + _kPortSize / 2,
      placed.offset.dy + _kHeaderHeight / 2,
    );

    // Main input port: left side of the main widget, one port per child.
    final to = Offset(
      _kMainLeft - _kPortSize / 2,
      _kMainTop +
          _kHeaderHeight +
          inputIndex * _kPortRowHeight +
          _kPortRowHeight / 2,
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
