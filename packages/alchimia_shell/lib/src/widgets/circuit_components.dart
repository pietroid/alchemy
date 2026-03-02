import 'package:alchimia_shell/src/layout_constants.dart';
import 'package:flutter/material.dart';

/// Shared sub-widgets for physical circuit component representations.
/// These are private to the shell package.

/// A narrow header band at the top of a circuit component, showing a label.
class ComponentHeader extends StatelessWidget {
  const ComponentHeader(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: kCircuitHeaderHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outline),
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}

/// A small filled circle representing a single port.
class PortCircle extends StatelessWidget {
  const PortCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: kCircuitPortSize,
      height: kCircuitPortSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.outline,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// A vertical column of input port circles with labels, aligned to the left
/// side of a circuit component.
class InputPortColumn extends StatelessWidget {
  const InputPortColumn({
    required this.portLabels,
    super.key,
  });

  final List<String> portLabels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kCircuitHeaderHeight),
        ...portLabels.map(
          (label) => SizedBox(
            height: kCircuitPortRowHeight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PortCircle(),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A single output port stub on the right side of a circuit component.
class OutputPortStub extends StatelessWidget {
  const OutputPortStub({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: kCircuitHeaderHeight),
        SizedBox(
          height: kCircuitPortRowHeight,
          child: PortCircle(),
        ),
      ],
    );
  }
}
