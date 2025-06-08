import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/entities/points_entity.dart';
import '../../../../domain/entities/stamp_entity.dart';
import '../../../../services/helpers/app_route_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';

class ProgramCard extends StatelessWidget {
  final LoyaltyProgramEntity program;

  const ProgramCard({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .12,
                  height: MediaQuery.of(context).size.height * .05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: SvgPicture.asset(
                      program.type.iconPath,
                      semanticsLabel: 'Program icon',
                      // width: 24,
                      // height: 24,
                      colorFilter: ColorFilter.srgbToLinearGamma(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  program.type.label.toLowerCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  program.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Column(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (program is StampEntity) ...{
                    Text("Number of holes: ${(program as StampEntity).numberHoles.toString()}"),
                    Text("Winning numbers: ${(program as StampEntity).winningNumbers.join(', ')}"),
                  },
                  if (program is PointsEntity) ...{
                    Text("value of a point: ${(program as PointsEntity).points ?? ''}"),
                  },
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoute.programDetails.name, extra: program);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: Theme.of(context).textButtonTheme.style?.textStyle?.resolve({})?.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
