import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlacedWidget', () {
    const widget = BoxWidgetData(
      width: 100,
      height: 50,
      color: Color(0xFF0000FF),
    );
    const offset = Offset(600, 80);

    test('stores data and offset', () {
      const placed = PlacedWidget(data: widget, offset: offset);
      expect(placed.data, widget);
      expect(placed.offset, offset);
    });

    test('copyWith replaces offset', () {
      const placed = PlacedWidget(data: widget, offset: offset);
      final moved = placed.copyWith(offset: const Offset(700, 200));

      expect(moved.offset, const Offset(700, 200));
      expect(moved.data, widget);
    });

    test('copyWith replaces data', () {
      const placed = PlacedWidget(data: widget, offset: offset);
      const newWidget = BoxWidgetData(
        width: 200,
        height: 80,
        color: Color(0xFFFF0000),
      );
      final updated = placed.copyWith(data: newWidget);

      expect(updated.data, newWidget);
      expect(updated.offset, offset);
    });

    test('equality holds for same data and offset', () {
      const a = PlacedWidget(data: widget, offset: offset);
      const b = PlacedWidget(data: widget, offset: offset);

      expect(a, equals(b));
    });

    test('inequality holds for different offsets', () {
      const a = PlacedWidget(data: widget, offset: Offset(600, 80));
      const b = PlacedWidget(data: widget, offset: Offset(700, 200));

      expect(a, isNot(equals(b)));
    });
  });
}
