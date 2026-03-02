import 'package:alchimia_engine/src/data/main_widget_data.dart';
import 'package:alchimia_engine/src/renderer/engine_renderer.dart';
import 'package:flutter/material.dart';

extension MainWidgetRenderer on MainWidgetData {
  /// Renders this [MainWidgetData] as a 390×844 bordered container with
  /// scrollable children.
  Widget toWidget(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border.all(color: const Color(0xFF2A2A2A)),
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
