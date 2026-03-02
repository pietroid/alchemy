import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:alchimia_shell/src/models/widget_catalog_item.dart';
import 'package:alchimia_shell/src/widgets/table_view.dart';
import 'package:alchimia_shell/src/widgets/widget_menu_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Top-level shell that provides canvas state and assembles the layout.
class ShellView extends StatelessWidget {
  const ShellView({this.catalog, super.key});

  /// Widget palette. Defaults to a single BOX entry when null.
  final List<WidgetCatalogItem>? catalog;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final items =
        catalog ??
        [
          WidgetCatalogItem(
            name: 'BOX',
            payloadFactory:
                () => BoxWidgetData(
                  width: 120,
                  height: 80,
                  color: colorScheme.primary,
                ),
          ),
        ];

    return BlocProvider(
      create: (_) => CanvasCubit(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: Row(
          children: [WidgetMenuPanel(items: items), const TableView()],
        ),
      ),
    );
  }
}
