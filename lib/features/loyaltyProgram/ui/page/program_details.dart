import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/entities/points_entity.dart';
import '../../../../domain/entities/stamp_entity.dart';
import '../../../core/utilities/app_icon.dart';

class ProgramDetails extends StatelessWidget {
  const ProgramDetails({super.key, required this.program});

  final LoyaltyProgramEntity program;

  @override
  Widget build(BuildContext context) {
    print(program);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: AppIcon.arrowLeft(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: AppIcon.stamp(icon: program.type.icon, color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Expanded(
                      child: Text(
                        program.name!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(program.type.label),
                    if (program is StampEntity) ...{
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          (program as StampEntity).numberHoles,
                          (index) {
                            bool isReward = (program as StampEntity).winningNumbers.contains(index + 1);
                            return CircleAvatar(
                              radius: 32,
                              backgroundColor: isReward ? Theme.of(context).colorScheme.primaryFixed : Colors.grey.shade300,
                              child: isReward ? AppIcon.reward(color: Theme.of(context).colorScheme.primary) : Text('${index + 1}'),
                            );
                          },
                        ),
                      ),
                    } else if (program is PointsEntity) ...{
                      Text(
                        (program as PointsEntity).points.toString(),
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    },
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
