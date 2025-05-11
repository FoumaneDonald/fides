import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
import '../../../core/widgets/loader.dart';
import '../../../homePage/ui/widgets/program_card.dart';
import '../bloc/loyalty_program_bloc.dart';

class Programs extends StatelessWidget {
  const Programs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programs'),
        actions: [
          IconButton(onPressed: () => context.pushNamed(AppRoute.selectLoyaltyProgram.name), icon: Icon(Icons.add_circle)),
        ],
      ),
      body: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            return showSnackBar(context, state.message!);
          }
        },
        builder: (context, state) {
          if( state.status == Status.loading ){
            return Center(child: Loader());
          }
          if( state.listOfPrograms!.isEmpty) {
            return Center(
              child: Text('Tap on the + button top left to create a program'),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Determine column count based on available width
                    final double width = constraints.maxWidth;
                    int columns;

                    if (width >= 1024) {
                      columns = 4; // Desktop
                    } else if (width >= 600) {
                      columns = 3; // Tablet
                    } else {
                      columns = 2; // Mobile
                    }
                    return LayoutGrid(
                      columnSizes: List.generate(columns, (_) => auto),
                      rowSizes: List<TrackSize>.generate((state.listOfPrograms!.length / 2).ceil(), (_) => auto),
                      columnGap: 8,
                      rowGap: 8,
                      autoPlacement: AutoPlacement.rowSparse,
                      children: state.listOfPrograms!.map((program) => ProgramCard(program: program)).toList(),
                    );
                  }
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
