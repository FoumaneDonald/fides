import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
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
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: .6,
            padding: EdgeInsets.all(16),
            children: state.listOfPrograms!.map((program) => ProgramCard(program: program)).toList(),
          );
          // return Wrap(
          //   spacing: 8,
          //   runSpacing: 8,
          //   children: [
          //     ListView.builder(
          //       padding: EdgeInsets.all(16),
          //       scrollDirection: Axis.horizontal,
          //       itemCount: state.listOfPrograms!.isEmpty ? 1 : state.listOfPrograms!.length,
          //       itemBuilder: (context, index) {
          //         final programs = state.listOfPrograms!;
          //         if (state.listOfPrograms!.isEmpty) {
          //           return Center(child: Text('Create a program'));
          //         }
          //         return ProgramCard(program: programs[index]);
          //       },
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
