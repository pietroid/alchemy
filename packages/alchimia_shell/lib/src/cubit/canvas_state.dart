part of 'canvas_cubit.dart';

/// Immutable state for [CanvasCubit].
class CanvasState extends Equatable {
  const CanvasState({
    this.mainWidget = const MainWidgetData(),
    this.placedWidgets = const [],
  });

  /// The root main widget with all connected children.
  final MainWidgetData mainWidget;

  /// Ordered list of placed widget representations on the table.
  final List<PlacedWidget> placedWidgets;

  CanvasState copyWith({
    MainWidgetData? mainWidget,
    List<PlacedWidget>? placedWidgets,
  }) {
    return CanvasState(
      mainWidget: mainWidget ?? this.mainWidget,
      placedWidgets: placedWidgets ?? this.placedWidgets,
    );
  }

  @override
  List<Object?> get props => [mainWidget, placedWidgets];
}
