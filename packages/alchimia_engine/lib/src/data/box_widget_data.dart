import 'dart:ui';

import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_engine/src/data/widget_type.dart';

/// Payload for rendering a plain colored container.
class BoxWidgetData extends WidgetData {
  const BoxWidgetData({
    required this.width,
    required this.height,
    required this.color,
  }) : super(type: WidgetType.box);

  factory BoxWidgetData.fromJson(Map<String, dynamic> json) {
    return BoxWidgetData(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      color: Color(json['color'] as int),
    );
  }

  final double width;
  final double height;
  final Color color;

  Map<String, dynamic> toJson() => {
    'type': type.toString(),
    'width': width,
    'height': height,
    'color': color.toARGB32(),
  };

  @override
  List<Object?> get props => [type, width, height, color];
}
