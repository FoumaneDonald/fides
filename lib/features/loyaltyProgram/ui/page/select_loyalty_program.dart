import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../core/widgets/fides_app_bar.dart';
import '../bloc/loyalty_program_bloc.dart';
import '../widgets/loyalty_program_card.dart';

class SelectLoyaltyProgram extends StatelessWidget {
  const SelectLoyaltyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FidesAppBar(
        title: 'Choose a program',
      ),
      body: SafeArea(
        child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
          listener: (context, state) {
            // final route = ModalRoute.of(context);
            // final isCurrentRoute = route?.isCurrent ?? false;
            //
            // if (state.status == Status.ongoing && isCurrentRoute) {
            //   context.pushNamed(AppRoute.aboutProgram.name);
            // }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    LoyaltyProgramCardSelection(
                      programName: ProgramType.returning.title,
                      programDescription: ProgramType.returning.description,
                      programIcon: AppIcon.stamp(),
                      onPressed: () {
                        context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram(ProgramType.returning));
                        context.pushNamed(AppRoute.aboutProgram.name);
                      },
                    ),
                    LoyaltyProgramCardSelection(
                      programName: ProgramType.spend.title,
                      programDescription: ProgramType.spend.description,
                      programIcon: AppIcon.points(),
                      onPressed: () {
                        context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram(ProgramType.spend));
                        context.pushNamed(AppRoute.aboutProgram.name);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
