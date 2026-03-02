import 'package:alchimia_engine/src/data/box_widget_data.dart';
import 'package:alchimia_engine/src/data/main_widget_data.dart';
import 'package:alchimia_engine/src/data/widget_data.dart';
import 'package:alchimia_engine/src/data/widget_type.dart';
import 'package:alchimia_engine/src/renderer/box_widget_renderer.dart';
import 'package:alchimia_engine/src/renderer/main_widget_renderer.dart';
import 'package:flutter/material.dart';

/// Renders a [WidgetData] into its corresponding Flutter widget.
class EngineRenderer extends StatelessWidget {
  const EngineRenderer({required this.data, super.key});

  final WidgetData data;

  @override
  Widget build(BuildContext context) {
    return switch (data.type) {
      WidgetType.box => (data as BoxWidgetData).toWidget(),
      WidgetType.main => (data as MainWidgetData).toWidget(context),
      _ => const SizedBox.shrink(),
    };
  }
}
