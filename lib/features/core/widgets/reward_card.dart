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
        leading: Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          child: Icon(
            Icons.circle,
            color: Colors.black38,
            size: 24,
          ),
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(
            Icons.delete_outline_rounded,
            size: 24,
            color: Colors.redAccent,
          ),
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
                if(programType == ProgramType.points)
                  Text(reward.rewardCost?.toString() ?? ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
