import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/models/placed_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'canvas_state.dart';

/// Manages the circuit table state: the main widget and placed child widgets.
class CanvasCubit extends Cubit<CanvasState> {
  CanvasCubit() : super(const CanvasState());

  /// Adds [widgetData] as a child of the main widget and places it on the
  /// table at [tableOffset].
  void addWidget(WidgetData widgetData, {required Offset tableOffset}) {
    final newChildren = [...state.mainWidget.children, widgetData];
    final newPlaced = [
      ...state.placedWidgets,
      PlacedWidget(data: widgetData, offset: tableOffset),
    ];
    emit(
      state.copyWith(
        mainWidget: state.mainWidget.copyWith(children: newChildren),
        placedWidgets: newPlaced,
      ),
    );
  }

  /// Updates the table position of the placed widget at [index].
  void moveWidget(int index, Offset newOffset) {
    final updated = List<PlacedWidget>.from(state.placedWidgets);
    updated[index] = updated[index].copyWith(offset: newOffset);
    emit(state.copyWith(placedWidgets: updated));
  }
}
