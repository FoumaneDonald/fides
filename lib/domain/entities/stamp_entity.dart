import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../data/models/stamp_model.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

//Todo: add the relation between [RewardEntity] and [StampEntity]
class StampEntity extends Equatable implements LoyaltyProgramEntity {
  final int? id;
  final String? uid;
  @override
  final String? name;
  @override
  final ProgramType? type;
  final int? numberHoles;
  final List<int>? winningNumbers;

  const StampEntity({
    this.id,
    this.uid,
    this.type,
    this.name,
    this.numberHoles,
    this.winningNumbers,
  });

  StampEntity copyWith({
    int? id,
    String? uid,
    ProgramType? type,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
  }) {
    return StampEntity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
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
      uid: model.uid,
      type: ProgramType.from(model.type),
      name: model.name,
      numberHoles: model.numberHoles,
      winningNumbers: model.winningNumbers,
    );
  }

  @override
  List<Object?> get props => [id, uid, type, name, numberHoles, winningNumbers];
}
