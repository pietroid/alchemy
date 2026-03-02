import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// A [WidgetData] with a position on the circuit table.
class PlacedWidget extends Equatable {
  const PlacedWidget({required this.data, required this.offset});

  /// The widget data to render.
  final WidgetData data;

  /// Position of the physical representation on the table.
  final Offset offset;

  /// Returns a copy with [data] and/or [offset] replaced.
  PlacedWidget copyWith({WidgetData? data, Offset? offset}) {
    return PlacedWidget(
      data: data ?? this.data,
      offset: offset ?? this.offset,
    );
  }

  @override
  List<Object?> get props => [data, offset];
}
