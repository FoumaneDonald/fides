import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../core/enums/time_units.dart';
import '../../services/helpers/program_type_enum.dart';

abstract class LoyaltyProgramEntity<T> extends Equatable {
  final String programId;
  final String name;
  final ProgramType type;
  final List<RewardEntity> rewards;
  final int lastingNumber;
  final TimeUnit lastingPeriod;
  final DateTime? startingDate;
  final DateTime? endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LoyaltyProgramEntity({
    required this.programId,
    required this.name,
    required this.type,
    required this.rewards,
    required this.lastingNumber,
    required this.lastingPeriod,
    this.startingDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  T cloneWith({
    String? name,
    ProgramType? type,
    List<RewardEntity>? rewards,
    int? lastingNumber,
    TimeUnit? lastingPeriod,
    DateTime? startingDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  List<Object?> get props => [programId, type, name, rewards, lastingNumber, lastingPeriod, startingDate, endDate, createdAt, updatedAt];
}
