import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../data/models/loyalty_program_model.dart';
import '../../services/helpers/program_type_enum.dart';

//Todo: add the relation between [RewardEntity] and [LoyaltyProgramEntity]
class LoyaltyProgramEntity extends Equatable {
  final int? id;
  final String? uid;
  final ProgramType? type;
  final String? name;
  final String? pointValue;
  final int? numberHoles;
  final List<int>? winningNumbers;

  const LoyaltyProgramEntity({
    this.id,
    this.uid,
    this.type,
    this.name,
    this.pointValue,
    this.numberHoles,
    this.winningNumbers,
  });

  LoyaltyProgramEntity copyWith({
    int? id,
    String? uid,
    ProgramType? type,
    String? name,
    Value<String?>? pointValue,
    Value<int?>? numberHoles,
    Value<List<int>?>? winningNumbers,
  }) {
    return LoyaltyProgramEntity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      name: name ?? this.name,
      pointValue: pointValue != null ? pointValue.value : this.pointValue,
      numberHoles: numberHoles != null ? numberHoles.value : this.numberHoles,
      winningNumbers: winningNumbers != null ? winningNumbers.value : this.winningNumbers,
    );
  }

  ///Convert Model to Entity
  factory LoyaltyProgramEntity.fromModel(LoyaltyProgramModel model) {
    return LoyaltyProgramEntity(
      id: model.id ?? 0,
      uid: model.uid,
      type: ProgramType.from(model.type),
      name: model.name,
      pointValue: model.pointValue,
      numberHoles: model.numberHoles,
      winningNumbers: model.winningNumbers,
    );
  }

  @override
  List<Object?> get props => [id, uid, type, name, pointValue, numberHoles, winningNumbers];
}
