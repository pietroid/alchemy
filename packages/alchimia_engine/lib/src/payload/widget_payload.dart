import 'dart:ui';

/// Base class for all widget payloads.
///
/// A payload carries the data needed to render a specific widget type.
abstract class WidgetPayload {
  const WidgetPayload();
}

/// Payload for rendering a plain colored container.
class ContainerPayload extends WidgetPayload {
  const ContainerPayload({
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  //TODO(any): Consider the usage of equatable.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainerPayload &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height &&
          color == other.color;

  @override
  int get hashCode => Object.hash(width, height, color);
}
