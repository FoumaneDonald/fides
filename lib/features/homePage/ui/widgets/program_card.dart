import 'package:fides/domain/entities/loyalty_program_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain/entities/points_entity.dart';
import '../../../../domain/entities/stamp_entity.dart';
import '../../../../services/helpers/program_type_enum.dart';

class ProgramCard extends StatelessWidget {
  final Object program;

  const ProgramCard({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    // Variables to hold extracted values after type check
    ProgramType? type;
    String? name;
    int? numberHoles;
    double? points;


    if (program is StampEntity) {
      // Cast to StampEntity to access properties safely
      final stampProgram = program as StampEntity;
      type = stampProgram.type;
      name = stampProgram.name;
      numberHoles = stampProgram.numberHoles;
    } else if (program is PointsEntity) {
      // Cast to PointsEntity to access properties safely
      final pointsProgram = program as PointsEntity;
      type = pointsProgram.type;
      name = pointsProgram.name;
      points = pointsProgram.points;
    } else {
      name = 'Unknown program';
    }

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
            Flexible(
              child: Column(
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
                        type?.iconPath ?? ProgramType.unknown.iconPath,
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
                    type?.label.toLowerCase() ?? ProgramType.unknown.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    ///Todo remove the nullability
                    name ?? 'Name should not be empty',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (type == ProgramType.stamp) ...{
                  Text("Number of holes: ${numberHoles?.toString() ?? ''}"),
                  Text("Number of holes: "),
                  // ...?program.winningNumbers?.map((number) => Text("Winning numbers: ${number.toString()}")),
                },
                if (type == ProgramType.points) ...{
                  Text("value of a point: ${points ?? ''}"),
                },
              ],
            ),
            TextButton(
              onPressed: () {},
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
