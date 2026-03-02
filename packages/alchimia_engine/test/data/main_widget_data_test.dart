import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainWidgetData', () {
    test('initial children is empty', () {
      const data = MainWidgetData();
      expect(data.children, isEmpty);
    });

    test('copyWith replaces children', () {
      const child = BoxWidgetData(
        width: 100,
        height: 50,
        color: Color(0xFF0000FF),
      );
      const data = MainWidgetData();
      final updated = data.copyWith(children: const [child]);

      expect(updated.children, const [child]);
    });

    test('copyWith without arguments returns equivalent object', () {
      const child = BoxWidgetData(
        width: 100,
        height: 50,
        color: Color(0xFF0000FF),
      );
      const data = MainWidgetData(children: [child]);
      final copy = data.copyWith();

      expect(copy, equals(data));
    });

    test('equality holds for same children', () {
      const child = BoxWidgetData(
        width: 100,
        height: 50,
        color: Color(0xFF0000FF),
      );
      const a = MainWidgetData(children: [child]);
      const b = MainWidgetData(children: [child]);

      expect(a, equals(b));
    });

    test('inequality holds for different children', () {
      const child1 = BoxWidgetData(
        width: 100,
        height: 50,
        color: Color(0xFF0000FF),
      );
      const child2 = BoxWidgetData(
        width: 200,
        height: 80,
        color: Color(0xFFFF0000),
      );
      const a = MainWidgetData(children: [child1]);
      const b = MainWidgetData(children: [child2]);

      expect(a, isNot(equals(b)));
    });
  });
}
