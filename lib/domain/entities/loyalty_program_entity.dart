import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../data/models/loyalty_program_model.dart';
import '../../services/helpers/program_type_enum.dart';

//Todo: add the relation between [RewardEntity] and [LoyaltyProgramEntity]
class LoyaltyProgramEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? type;
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

  // Use enum in the UI logic
  ProgramType get programType => ProgramType.from(type);

  // Optional: If you ever need to build an updated entity using the enum
  LoyaltyProgramEntity copyWithProgramType(ProgramType value) {
    return copyWith(type: value.label);
  }

  LoyaltyProgramEntity copyWith({
    int? id,
    String? uid,
    String? type,
    String? name,
    String? pointValue,
    Value<int?>? numberHoles,
    Value<List<int>?>? winningNumbers,
  }) {
    return LoyaltyProgramEntity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      name: name ?? this.name,
      pointValue: pointValue ?? this.pointValue,
      numberHoles: numberHoles != null ? numberHoles.value : this.numberHoles,
      winningNumbers: winningNumbers != null ? winningNumbers.value : this.winningNumbers,
    );
  }

  ///Convert Model to Entity
  factory LoyaltyProgramEntity.fromModel(LoyaltyProgramModel model) {
    return LoyaltyProgramEntity(
      id: model.id ?? 0,
      uid: model.uid,
      type: model.type,
      name: model.name,
      pointValue: model.pointValue,
      numberHoles: model.numberHoles,
      winningNumbers: model.winningNumbers,
    );
  }

  @override
  List<Object?> get props => [id, uid, type, name, pointValue, numberHoles, winningNumbers];
}
