import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/loyalty_program_entity.dart';
import '../../../domain/entities/spend_entity.dart';
import '../../../domain/entities/return_entity.dart';
import '../../core/utilities/app_icon.dart';

class ProgramDetails extends StatelessWidget {
  const ProgramDetails({super.key, required this.program});

  final LoyaltyProgramEntity program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: AppIcon.arrowLeft(),
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
                      child: AppIcon.stamp(),
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
                    if (program is ReturnEntity) ...{
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          (program as ReturnEntity).numberHoles,
                          (index) {
                            bool isReward = (program as ReturnEntity).winningNumbers.contains(index + 1);
                            return CircleAvatar(
                              radius: 32,
                              backgroundColor: isReward ? Theme.of(context).colorScheme.primaryFixed : Colors.grey.shade300,
                              child: isReward ? AppIcon.reward() : Text('${index + 1}'),
                            );
                          },
                        ),
                      ),
                    } else if (program is SpendEntity) ...{
                      Text(
                        (program as SpendEntity).points.toString(),
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
