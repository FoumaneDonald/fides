import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../bloc/loyalty_program_bloc.dart';
import '../widgets/loyalty_program_card.dart';

class SelectLoyaltyProgram extends StatelessWidget {
  const SelectLoyaltyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your loyalty program'),
      ),
      body: SafeArea(
        child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
          listener: (context, state) {
            final route = ModalRoute.of(context);
            final isCurrentRoute = route?.isCurrent ?? false;

            if (state.status == Status.ongoing && isCurrentRoute) {
              context.pushNamed(AppRoute.pointsProgram.name);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pick the type of program that best fits your business - simple stamps or flexible points. You can customize the details in the next step.'),
                          SizedBox(height: 24),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LoyaltyProgramCardSelection(
                                programName: ProgramType.stamp.title,
                                programDescription: ProgramType.stamp.description,
                                programImage: ProgramType.stamp.iconPath,
                                onPressed: () => context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram(ProgramType.stamp)),
                              ),
                              SizedBox(height: 16),
                              LoyaltyProgramCardSelection(
                                programName: ProgramType.points.title,
                                programDescription: ProgramType.points.description,
                                programImage: ProgramType.points.iconPath,
                                onPressed: () => context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram(ProgramType.points)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
