import 'package:beamer/beamer.dart';
import 'package:fides/domain/entities/loyalty_program_entity.dart';
import 'package:flutter/material.dart';

import '../../features/loyaltyProgram/ui/page/about_program.dart';
import '../../features/loyaltyProgram/ui/page/program_details.dart';
import '../../features/loyaltyProgram/ui/page/program_reward.dart';
import '../../features/loyaltyProgram/ui/page/programs.dart';
import '../../features/loyaltyProgram/ui/page/select_loyalty_program.dart';
import '../../services/helpers/app_route_enum.dart';

class ProgramLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        AppRoute.programs.path,
        AppRoute.programs.path + AppRoute.programDetails.path,
        AppRoute.programs.path + AppRoute.selectLoyaltyProgram.path,
        AppRoute.programs.path + AppRoute.selectLoyaltyProgram.path + AppRoute.aboutProgram.path,
        AppRoute.programs.path + AppRoute.selectLoyaltyProgram.path + AppRoute.aboutProgram.path + AppRoute.programReward.path,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final program = state.routeState as LoyaltyProgramEntity;
    return [
      BeamPage(
        key: ValueKey(AppRoute.programs.name),
        title: AppRoute.programs.name.toUpperCase(),
        child: Programs(),
      ),
      if (state.pathParameters.containsKey('programId'))
        BeamPage(
          key: ValueKey('program-${state.pathParameters['programId']}'),
          title: program.name,
          child: ProgramDetails(program: program),
        ),
      BeamPage(
        key: ValueKey(AppRoute.programs.name + AppRoute.selectLoyaltyProgram.name),
        title: AppRoute.selectLoyaltyProgram.name.toUpperCase(),
        child: SelectLoyaltyProgram(),
      ),
      BeamPage(
        key: ValueKey(AppRoute.programs.name + AppRoute.selectLoyaltyProgram.name + AppRoute.aboutProgram.name),
        title: AppRoute.aboutProgram.name.toUpperCase(),
        child: AboutProgram(),
      ),
      BeamPage(
        key: ValueKey(AppRoute.programs.name + AppRoute.selectLoyaltyProgram.name + AppRoute.aboutProgram.name + AppRoute.programReward.name),
        title: AppRoute.programReward.name.toUpperCase(),
        child: ProgramReward(),
      ),
    ];
  }
}
