import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/reward_entity.dart';
import '../../../services/helpers/program_type_enum.dart';
import '../../../services/helpers/reward_type_enum.dart';

class RewardCard extends StatelessWidget {
  final Function() onDelete;
  final RewardEntity reward;
  final ProgramType programType;
  const RewardCard({super.key, required this.reward, required this.onDelete, required this.programType});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: AppIcon.gift(),
        trailing: IconButton(
          onPressed: onDelete,
          icon: AppIcon.trash(color: Theme.of(context).colorScheme.error),
        ),
        title: Text(reward.type.label),
        subtitle: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reward.description),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Text(reward.item),
                if (reward.type == RewardType.discount)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(reward.discountValue.toString()),
                      Text(reward.discountType!.label),
                    ],
                  ),
                if(programType == ProgramType.spend)
                  Text(reward.unlockThreshold.toString() ?? ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
