import 'package:alchimia_engine/src/data/widget_data.dart';
import 'package:alchimia_engine/src/data/widget_type.dart';

/// Payload for the root main widget on the circuit table.
///
/// Holds an ordered list of child [WidgetData]s that are wired into it.
class MainWidgetData extends WidgetData {
  const MainWidgetData({this.children = const []})
      : super(type: WidgetType.main);

  /// Ordered list of child widgets connected to this main widget.
  final List<WidgetData> children;

  /// Returns a copy with [children] replaced if provided.
  MainWidgetData copyWith({List<WidgetData>? children}) =>
      MainWidgetData(children: children ?? this.children);

  @override
  List<Object?> get props => [type, children];
}
