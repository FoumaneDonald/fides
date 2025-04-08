import 'package:fides/data/entities/loyaltyProgramEntity.dart';
import 'package:fides/features/homePage/ui/widgets/programCard.dart';
import 'package:flutter/material.dart';

class LoyaltyProgramSection extends StatelessWidget {
  final List<LoyaltyProgramEntity> loyaltyPrograms;

  const LoyaltyProgramSection({
    super.key,
    required this.loyaltyPrograms,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Loyalty programs'),
            Text('see all'),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: loyaltyPrograms.isEmpty ? 1 : loyaltyPrograms.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              if( loyaltyPrograms.isEmpty){
                return Center(child: Text('Create a program'));
              }
              return SizedBox(
                width: 140,
                child: ProgramCard(program: loyaltyPrograms[index],),
              );
            },
          ),
        ),
      ],
    );
  }
}
