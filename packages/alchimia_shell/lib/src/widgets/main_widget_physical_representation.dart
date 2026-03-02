import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/widgets/circuit_components.dart';
import 'package:flutter/material.dart';

/// Physical circuit representation of the main widget.
///
/// Renders as a bordered body with a "MAIN" header and the engine canvas
/// inside, flanked by an [InputPortColumn] on the left (one port per child)
/// and an [OutputPortStub] on the right.
class MainWidgetPhysicalRepresentation extends StatelessWidget {
  const MainWidgetPhysicalRepresentation({
    required this.mainWidgetData,
    super.key,
  });

  final MainWidgetData mainWidgetData;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final portLabels = mainWidgetData.children.map((c) => c.type.name).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputPortColumn(portLabels: portLabels),
        Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            border: Border.all(color: colorScheme.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ComponentHeader('MAIN'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: mainWidgetData.children
                        .map((child) => EngineRenderer(data: child))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const OutputPortStub(),
      ],
    );
  }
}
