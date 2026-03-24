import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../core/enums/time_units.dart';
import '../../services/helpers/program_type_enum.dart';

abstract class LoyaltyProgramEntity<T> extends Equatable {
  final String programId;
  final String name;
  final ProgramType type;
  final int validityMonth;
  final String? note;
  final List<RewardEntity> rewards;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LoyaltyProgramEntity({
    required this.programId,
    required this.name,
    required this.type,
    required this.validityMonth,
    required this.rewards,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  T cloneWith({
    String? name,
    ProgramType? type,
    int? validityMonth,
    String? note,
    List<RewardEntity>? rewards,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  List<Object?> get props => [programId, type, name, rewards, validityMonth, note, createdAt, updatedAt];
}
