import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CanvasCubit.moveWidget', () {
    blocTest<CanvasCubit, CanvasState>(
      'accumulates delta onto the current offset',
      build: CanvasCubit.new,
      seed: () => const CanvasState(
        mainWidget: MainWidgetData(
          children: [
            BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
          ],
        ),
        placedWidgets: [
          PlacedWidget(
            data: BoxWidgetData(
              width: 100,
              height: 50,
              color: Color(0xFF0000FF),
            ),
            offset: Offset(600, 80),
          ),
        ],
      ),
      act: (cubit) => cubit.moveWidget(0, const Offset(100, 120)),
      expect: () => const [
        CanvasState(
          mainWidget: MainWidgetData(
            children: [
              BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
            ],
          ),
          placedWidgets: [
            PlacedWidget(
              data: BoxWidgetData(
                width: 100,
                height: 50,
                color: Color(0xFF0000FF),
              ),
              offset: Offset(700, 200),
            ),
          ],
        ),
      ],
    );

    blocTest<CanvasCubit, CanvasState>(
      'does not affect other placed widgets when moving one',
      build: CanvasCubit.new,
      seed: () => const CanvasState(
        mainWidget: MainWidgetData(
          children: [
            BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
            BoxWidgetData(width: 200, height: 80, color: Color(0xFFFF0000)),
          ],
        ),
        placedWidgets: [
          PlacedWidget(
            data: BoxWidgetData(
              width: 100,
              height: 50,
              color: Color(0xFF0000FF),
            ),
            offset: Offset(600, 80),
          ),
          PlacedWidget(
            data: BoxWidgetData(
              width: 200,
              height: 80,
              color: Color(0xFFFF0000),
            ),
            offset: Offset(600, 264),
          ),
        ],
      ),
      act: (cubit) => cubit.moveWidget(1, const Offset(200, 36)),
      expect: () => const [
        CanvasState(
          mainWidget: MainWidgetData(
            children: [
              BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
              BoxWidgetData(width: 200, height: 80, color: Color(0xFFFF0000)),
            ],
          ),
          placedWidgets: [
            PlacedWidget(
              data: BoxWidgetData(
                width: 100,
                height: 50,
                color: Color(0xFF0000FF),
              ),
              offset: Offset(600, 80),
            ),
            PlacedWidget(
              data: BoxWidgetData(
                width: 200,
                height: 80,
                color: Color(0xFFFF0000),
              ),
              offset: Offset(800, 300),
            ),
          ],
        ),
      ],
    );
  });
}
