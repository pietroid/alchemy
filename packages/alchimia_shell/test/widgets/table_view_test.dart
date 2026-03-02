import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:alchimia_shell/src/widgets/main_widget_physical_representation.dart';
import 'package:alchimia_shell/src/widgets/table_view.dart';
import 'package:alchimia_shell/src/widgets/widget_physical_representation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _buildTable() {
  return MaterialApp(
    home: Scaffold(
      body: BlocProvider(
        create: (_) => CanvasCubit(),
        child: const Row(
          children: [Expanded(child: SizedBox()), TableView()],
        ),
      ),
    ),
  );
}

void main() {
  group('TableView', () {
    testWidgets('renders MainWidgetPhysicalRepresentation', (tester) async {
      await tester.pumpWidget(_buildTable());

      expect(find.byType(MainWidgetPhysicalRepresentation), findsOneWidget);
    });

    testWidgets(
      'renders WidgetPhysicalRepresentation after a simulated drop',
      (tester) async {
        await tester.pumpWidget(_buildTable());

        // Simulate a drop by interacting directly with the cubit.
        tester
            .element(find.byType(TableView))
            .read<CanvasCubit>()
            .addWidget(
              const BoxWidgetData(
                width: 100,
                height: 50,
                color: Color(0xFF0000FF),
              ),
              tableOffset: const Offset(600, 80),
            );
        await tester.pump();

        expect(find.byType(WidgetPhysicalRepresentation), findsOneWidget);
      },
    );
  });
}
