import 'package:fides/domain/entities/loyalty_program_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        program.type!.iconPath,
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
                    program.type!.label.toLowerCase(),
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
            ),
            Flexible(
              child: Column(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (program.type == ProgramType.stamp) ...{
                    Text("Number of holes: ${program.numberHoles?.toString() ?? ''}"),
                    ...?program.winningNumbers?.map((number) => Text("Winning numbers: ${number.toString()}")),
                  },
                  if (program.type == ProgramType.points) ...{
                    Text("value of a point: ${program.pointValue ?? ''}"),
                  },
                ],
              ),
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
