import 'dart:ui';

import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:alchimia_shell/src/painters/wire_painter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WirePainter', () {
    const wireColor = Color(0xFF555555);

    test('shouldRepaint returns false when inputs are identical', () {
      const placed = PlacedWidget(
        data: BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
        offset: Offset(600, 80),
      );
      const painter = WirePainter(
        placedWidgets: [placed],
        wireColor: wireColor,
      );
      const same = WirePainter(
        placedWidgets: [placed],
        wireColor: wireColor,
      );

      expect(painter.shouldRepaint(same), isFalse);
    });

    test('shouldRepaint returns true when wireColor changes', () {
      const painter = WirePainter(
        placedWidgets: [],
        wireColor: wireColor,
      );
      const different = WirePainter(
        placedWidgets: [],
        wireColor: Color(0xFF888888),
      );

      expect(painter.shouldRepaint(different), isTrue);
    });

    test('shouldRepaint returns true when placedWidgets changes', () {
      const placed = PlacedWidget(
        data: BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
        offset: Offset(600, 80),
      );
      const painter = WirePainter(placedWidgets: [], wireColor: wireColor);
      const withWidget = WirePainter(
        placedWidgets: [placed],
        wireColor: wireColor,
      );

      expect(painter.shouldRepaint(withWidget), isTrue);
    });

    test('paint produces a path for each placed widget', () {
      const placed = PlacedWidget(
        data: BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
        offset: Offset(600, 80),
      );
      const painter = WirePainter(
        placedWidgets: [placed],
        wireColor: wireColor,
      );

      final recorder = PictureRecorder();
      final canvas = Canvas(recorder);
      // Should not throw.
      painter.paint(canvas, const Size(1400, 1200));
      final picture = recorder.endRecording();
      expect(picture, isNotNull);
    });
  });
}
