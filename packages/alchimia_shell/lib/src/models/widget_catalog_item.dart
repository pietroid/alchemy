import 'package:alchimia_engine/alchimia_engine.dart';

/// Represents a draggable entry in the widget palette.
///
/// The [payloadFactory] is called each time a drag begins so every
/// drag gesture carries a fresh, independent [WidgetPayload] instance.
class WidgetCatalogItem {
  const WidgetCatalogItem({required this.name, required this.payloadFactory});

  /// Display name shown in the widget menu panel.
  final String name;

  /// Factory that produces a new [WidgetPayload] for each drag.
  final WidgetPayload Function() payloadFactory;
}
