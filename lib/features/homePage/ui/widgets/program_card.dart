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
    final programType = ProgramType.from(program.type);
    return SizedBox(
      width: MediaQuery.of(context).size.width * .2,
      child: Card(
        // elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      programType.iconPath,
                      semanticsLabel: 'Program icon',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.srgbToLinearGamma(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(program.name!),
                  Text('40 customers'),
                ],
              ),
              Text("id: ${program.id.toString()}"),
              Text("uid: ${program.uid!}"),
              Text("type: ${program.type!}"),
              Text("name: ${program.name!}"),
              Text("value of a point: ${program.pointValue ?? ''}"),
              Text("number of holes: ${program.numberHoles?.toString() ?? ''}"),
              Text("Winning numbers:"),
              ...?program.winningNumbers?.map((number) => Text(number.toString()))
            ],
          ),
        ),
      ),
    );
  }
}
