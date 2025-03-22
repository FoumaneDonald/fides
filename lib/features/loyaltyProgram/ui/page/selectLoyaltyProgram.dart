import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/loyaltyProgramCard.dart';

class SelectLoyaltyProgram extends StatelessWidget {
  const SelectLoyaltyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Loyalty program'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select loyalty program'),
                      SizedBox(height: 24),
                      Column(
                        children: [
                          LoyaltyProgramCard(
                            programName: 'Stamp-based program',
                            programDescription: 'A simple, classic loyalty program where customers earn a "stamp" (digital punch) for each qualifying purchase.',
                            programImage: '',
                          ),
                          SizedBox(height: 16),
                          LoyaltyProgramCard(
                            programName: 'Points-based program',
                            programDescription: 'A flexible loyalty program where customers earn points for every money spent.',
                            programImage: '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: () => context.goNamed('stampCardProgram'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Continue'), Icon(Icons.keyboard_arrow_right_rounded)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
