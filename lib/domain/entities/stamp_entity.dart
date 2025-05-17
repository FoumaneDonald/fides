import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../data/models/stamp_model.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

//Todo: add the relation between [RewardEntity] and [StampEntity]
class StampEntity extends LoyaltyProgramEntity {
  final int? id;
  @override
  final String? name;
  @override
  final ProgramType type;
  final int numberHoles;
  final List<int> winningNumbers;

  StampEntity({
    this.id,
    required this.type,
    this.name,
    required this.numberHoles,
    required this.winningNumbers,
  });

  @override
  StampEntity copyWith({
    int? id,
    ProgramType? type,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
  }) {
    return StampEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      numberHoles: numberHoles ?? this.numberHoles,
      winningNumbers: winningNumbers ?? this.winningNumbers,
    );
  }

  ///Convert Model to Entity
  factory StampEntity.fromModel(StampModel model) {
    return StampEntity(
      id: model.id ?? 0,
      type: ProgramType.from(model.type),
      name: model.name,
      numberHoles: model.numberHoles,
      winningNumbers: model.winningNumbers,
    );
  }

  @override
  List<Object?> get props => [id, type, name, numberHoles, winningNumbers];
}
