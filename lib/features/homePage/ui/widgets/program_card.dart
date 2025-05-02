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
    return SizedBox(
      // width: MediaQuery.of(context).size.width * .46,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .12,
                    // height: MediaQuery.of(context).size.height * .06,
                    padding: EdgeInsets.all(20),
                    // width: 48,
                    // height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        program.type!.iconPath,
                        semanticsLabel: 'Program icon',
                        width: 24,
                        height: 24,
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
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: Column(
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
              SizedBox(
                height: 16,
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
      ),
    );
  }
}
