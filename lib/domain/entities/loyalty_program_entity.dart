import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../services/helpers/program_type_enum.dart';

abstract class LoyaltyProgramEntity extends Equatable  {
  String? get name;
  ProgramType get type;
  List<RewardEntity> get rewards;

  LoyaltyProgramEntity copyWith({
    String? name,
    ProgramType? type,
    List<RewardEntity>? rewards,
  });

  @override
  List<Object?> get props => [type, name, rewards];
}
