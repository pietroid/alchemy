import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:alchimia_shell/src/widgets/main_widget_physical_representation.dart';
import 'package:alchimia_shell/src/widgets/table_grid.dart';
import 'package:alchimia_shell/src/widgets/widget_physical_representation.dart';
import 'package:alchimia_shell/src/widgets/wire_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Layout constants for the circuit table.
const double _kMainLeft = 60;
const double _kMainTop = 80;
const double _kChildColumnLeft = 600;
const double _kChildSpacing = 24;
const double _kEstimatedSlotHeight = 160;
const double _kTableWidth = 1400;
const double _kTableHeight = 1200;

/// The circuit table workspace.
///
/// Renders the main widget physical representation pinned to a fixed position,
/// child widget representations in a column to the right, bezier wires
/// connecting them, and a dot-grid background. Accepts [WidgetData] drops
/// and snaps new children to the child column.
class TableView extends StatelessWidget {
  const TableView({super.key});

  Offset _childOffset(int index) {
    return Offset(
      _kChildColumnLeft,
      _kMainTop + index * (_kEstimatedSlotHeight + _kChildSpacing),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: BlocBuilder<CanvasCubit, CanvasState>(
        builder: (context, state) {
          return DragTarget<WidgetData>(
            onAcceptWithDetails: (details) {
              final index = state.placedWidgets.length;
              context.read<CanvasCubit>().addWidget(
                    details.data,
                    tableOffset: _childOffset(index),
                  );
            },
            builder: (context, candidateData, rejectedData) {
              return ColoredBox(
                color: colorScheme.surface,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: _kTableWidth,
                      height: _kTableHeight,
                      child: Stack(
                        children: [
                          const Positioned.fill(child: TableGrid()),
                          Positioned(
                            left: _kMainLeft,
                            top: _kMainTop,
                            child: MainWidgetPhysicalRepresentation(
                              mainWidgetData: state.mainWidget,
                            ),
                          ),
                          Positioned.fill(
                            child: WireOverlay(
                              placedWidgets: state.placedWidgets,
                            ),
                          ),
                          for (var i = 0;
                              i < state.placedWidgets.length;
                              i++)
                            Positioned(
                              left: state.placedWidgets[i].offset.dx,
                              top: state.placedWidgets[i].offset.dy,
                              child: WidgetPhysicalRepresentation(
                                data: state.placedWidgets[i].data,
                                index: i,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
