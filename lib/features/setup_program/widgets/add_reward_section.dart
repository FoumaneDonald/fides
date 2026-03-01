import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/reward_entity.dart';
import '../../../services/helpers/app_route_enum.dart';
import '../../../services/helpers/program_type_enum.dart';
import '../../core/utilities/app_icon.dart';
import '../../core/widgets/reward_card.dart';

class AddRewardSection extends StatelessWidget {
  const AddRewardSection({
    super.key,
    required ProgramType programType,
    required List<RewardEntity> rewards,
    required List<int>? winningNumbers,
    required bool Function(int) isReturnNumberSelected,
    int? selectReturnNumber,
    required Function(int) onSelectedWinningNumber,
    required Function(RewardEntity reward) onDeleteReward,
  })  : _programType = programType,
        _rewards = rewards,
        _winningNumbers = winningNumbers,
        _isReturnNumberSelected = isReturnNumberSelected,
        _selectReturnNumber = selectReturnNumber,
        _onSelectedWinningNumber = onSelectedWinningNumber,
        _onDeleteReward = onDeleteReward;

  final ProgramType _programType;
  final List<RewardEntity> _rewards;
  final List<int>? _winningNumbers;
  final bool Function(int) _isReturnNumberSelected;
  final int? _selectReturnNumber;
  final Function(int) _onSelectedWinningNumber;
  final Function(RewardEntity reward) _onDeleteReward;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rewards', style: Theme.of(context).textTheme.titleLarge),
        switch (_programType) {
          ProgramType.spend => Column(
              children: [
                TextButton(
                  onPressed: () => context.pushNamed(AppRoute.programReward.name),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_rounded),
                      Text('Add Reward'),
                    ],
                  ),
                ),
                Column(
                  spacing: 8,
                  children: _rewards.map((reward) {
                    return RewardCard(
                      reward: reward,
                      programType: _programType,
                      onDelete: () => _onDeleteReward(reward),
                    );
                  }).toList(),
                ),
              ],
            ),
          ProgramType.returning => Builder(builder: (context) {
              return Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_winningNumbers!.isNotEmpty) ...{
                    Text('Select to create its reward', style: Theme.of(context).textTheme.bodyMedium),
                    Row(
                      spacing: 8,
                      children: _winningNumbers.map(
                        (number) {
                          return ChoiceChip(
                            label: Row(
                              spacing: 8,
                              children: [
                                AppIcon.stamp(size: 18.0),
                                Text(number.toString()),
                              ],
                            ),
                            showCheckmark: false,
                            selected: _isReturnNumberSelected(number),
                            onSelected: (bool value) => _onSelectedWinningNumber(number),
                          );
                        },
                      ).toList(),
                    ),
                  } else ...{
                    Center(child: Text('Please choose a stamp number to create rewards')),
                  },
                  if (_selectReturnNumber != null) ...{
                    TextButton(
                      onPressed: () => context.pushNamed(AppRoute.programReward.name),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_rounded),
                          Text('Add Reward for return $_selectReturnNumber'),
                        ],
                      ),
                    ),
                    Column(
                      spacing: 8,
                      children: _rewards.where((reward) => reward.unlockThreshold == _selectReturnNumber).map((reward) {
                        return RewardCard(
                          reward: reward,
                          programType: _programType,
                          onDelete: () => _onDeleteReward(reward),
                        );
                      }).toList(),
                    ),
                  },
                ],
              );
            }),
          ProgramType.unknown => SizedBox.shrink(),
        }
      ],
    );
  }
}
