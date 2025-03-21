import 'package:fides/features/home_page/ui/widgets/program_card.dart';
import 'package:flutter/material.dart';

class LoyaltyProgramSection extends StatelessWidget {
  const LoyaltyProgramSection({super.key});

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
        SizedBox(height: 8,),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
            itemBuilder: (context, index) => SizedBox(
              width: 140,
              child: ProgramCard(),
            ),
          ),
        ),
      ],
    );
  }
}
