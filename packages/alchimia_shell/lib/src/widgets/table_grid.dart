import 'package:flutter/material.dart';

/// [CustomPainter] that draws a dot grid for the circuit table background.
class TableGridPainter extends CustomPainter {
  const TableGridPainter({required this.dotColor});

  final Color dotColor;

  static const double _kSpacing = 24;
  static const double _kDotRadius = 1;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dotColor.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    var x = _kSpacing;
    while (x < size.width) {
      var y = _kSpacing;
      while (y < size.height) {
        canvas.drawCircle(Offset(x, y), _kDotRadius, paint);
        y += _kSpacing;
      }
      x += _kSpacing;
    }
  }

  @override
  bool shouldRepaint(TableGridPainter oldDelegate) =>
      oldDelegate.dotColor != dotColor;
}

/// A widget that fills its parent with a dot grid.
class TableGrid extends StatelessWidget {
  const TableGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CustomPaint(
      painter: TableGridPainter(dotColor: colorScheme.outline),
    );
  }
}
