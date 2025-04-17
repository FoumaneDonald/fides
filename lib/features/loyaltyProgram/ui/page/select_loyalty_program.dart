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
        title: Text('Loyalty program'),
      ),
      body: SafeArea(
        child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
          listener: (context, state) {
            final route = ModalRoute.of(context);
            final isCurrentRoute = route?.isCurrent ?? false;

            if(state.status == Status.ongoing && isCurrentRoute ){
              final type = state.loyaltyProgramEntity?.programType;

              if(type == ProgramType.stamp) {
                context.pushNamed(AppRoute.stampCardProgram.name);
              }else if(type == ProgramType.points){
                context.pushNamed(AppRoute.pointsProgram.name);
              }
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
                          Text('Select loyalty program'),
                          SizedBox(height: 24),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LoyaltyProgramCard(
                                programName: 'Stamp-based program',
                                programDescription: ProgramType.stamp.description,
                                programImage: ProgramType.stamp.iconPath,
                                onPressed: () => context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram(ProgramType.stamp.label)),
                              ),
                              SizedBox(height: 16),
                              LoyaltyProgramCard(
                                programName: 'Points-based program',
                                programDescription: ProgramType.points.description,
                                programImage: ProgramType.points.iconPath,
                                onPressed: () => context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram(ProgramType.points.label)),
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
