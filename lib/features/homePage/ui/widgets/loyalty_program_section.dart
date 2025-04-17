import 'package:fides/domain/entities/loyalty_program_entity.dart';
import 'package:fides/features/homePage/ui/widgets/program_card.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class LoyaltyProgramSection extends StatelessWidget {
  final List<LoyaltyProgramEntity> loyaltyPrograms;

  const LoyaltyProgramSection({
    super.key,
    required this.loyaltyPrograms,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.loyaltyPrograms),
              Text('see all'),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: loyaltyPrograms.isEmpty ? 1 : loyaltyPrograms.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              if( loyaltyPrograms.isEmpty){
                return Center(child: Text('Create a program'));
              }
              return ProgramCard(program: loyaltyPrograms[index],);
            },
          ),
        ),
      ],
    );
  }
}
