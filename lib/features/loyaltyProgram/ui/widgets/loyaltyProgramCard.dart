import 'package:flutter/material.dart';

class LoyaltyProgramCard extends StatelessWidget {
  final String _programName;
  final String _programDescription;
  final String _programImage;

  const LoyaltyProgramCard({
    super.key,
    required String programName,
    required String programDescription,
    required String programImage,
  })  : _programName = programName,
        _programDescription = programDescription,
        _programImage = programImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 92,
              decoration: BoxDecoration(
                color: Color(0xff40B7BF),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_programName),
                  SizedBox(
                    height: 4,
                  ),
                  Text(_programDescription),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
