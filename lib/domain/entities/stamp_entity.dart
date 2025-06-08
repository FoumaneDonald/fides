import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../data/models/stamp_model.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

class StampEntity extends LoyaltyProgramEntity {
  final int? id;
  @override
  final String? name;
  @override
  final ProgramType type;
  final int numberHoles;
  final List<int> winningNumbers;
  @override
  final List<RewardEntity> rewards;

  StampEntity({
    this.id,
    required this.type,
    this.name,
    required this.numberHoles,
    required this.winningNumbers,
    required this.rewards,
  });

  @override
  StampEntity copyWith({
    int? id,
    ProgramType? type,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
    List<RewardEntity>? rewards
  }) {
    return StampEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      numberHoles: numberHoles ?? this.numberHoles,
      winningNumbers: winningNumbers ?? this.winningNumbers,
      rewards: rewards ?? this.rewards,
    );
  }

  ///Convert Model to Entity
  factory StampEntity.fromModel(StampModel model) {
    final List<RewardEntity> rewards = RewardEntity.fromModelList(model.rewards);

    return StampEntity(
      id: model.id ?? 0,
      type: ProgramType.from(model.type),
      name: model.name,
      numberHoles: model.numberHoles,
      winningNumbers: model.winningNumbers,
      rewards: rewards
    );
  }

  static List<StampEntity> fromModelList(List<StampModel> models) {
    return models.map((model) => StampEntity.fromModel(model)).toList();
  }

  @override
  List<Object?> get props => [...super.props, name, numberHoles, winningNumbers];
}
