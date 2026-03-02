import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:alchimia_shell/src/layout_constants.dart';
import 'package:alchimia_shell/src/widgets/circuit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Physical circuit representation of a child widget placed on the table.
///
/// Renders as a 220px-wide bordered body with a type-name header and the
/// engine canvas inside, with an [OutputPortStub] on the right. Supports
/// drag-to-move via [GestureDetector.onPanUpdate].
class WidgetPhysicalRepresentation extends StatelessWidget {
  const WidgetPhysicalRepresentation({
    required this.data,
    required this.index,
    super.key,
  });

  final WidgetData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onPanUpdate: (details) {
        context.read<CanvasCubit>().moveWidget(index, details.delta);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: kCircuitComponentWidth,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              border: Border.all(color: colorScheme.outline),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ComponentHeader(data.type.name.toUpperCase()),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: EngineRenderer(data: data),
                ),
              ],
            ),
          ),
          const OutputPortStub(),
        ],
      ),
    );
  }
}
