import 'package:alchimia_engine/src/data/main_widget_data.dart';
import 'package:alchimia_engine/src/renderer/engine_renderer.dart';
import 'package:flutter/material.dart';

extension MainWidgetRenderer on MainWidgetData {
  /// Renders this [MainWidgetData] as a 390×844 bordered container with
  /// scrollable children.
  Widget toWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        border: Border.all(color: colorScheme.outline),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
              .map((child) => EngineRenderer(data: child))
              .toList(),
        ),
      ),
    );
  }
}
