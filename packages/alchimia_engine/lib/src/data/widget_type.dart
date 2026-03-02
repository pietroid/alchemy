/// Defines the types of widgets that can be rendered by the Alchimia engine.
enum WidgetType {
  unknown,

  /// Box is the internal name for the Container widget.
  box,

  /// Text maps directly into the Text Widget.
  text,

  /// Image maps directly into the Image Widget.
  image,

  /// Stateless maps directly into the StatelessWidget.
  stateless,

  /// Stateful maps directly into the StatefulWidget.
  stateful,

  /// Main represents the root widget container for the circuit table.
  main,
}
