import 'package:fides/data/entities/loyaltyProgramEntity.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final LoyaltyProgramEntity program;

  const ProgramCard({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Placeholder(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(program.name!),
                SizedBox(
                  height: 8,
                ),
                Text('40 customers'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
