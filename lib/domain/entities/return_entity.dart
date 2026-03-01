import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../core/enums/time_units.dart';
import '../../data/models/return_model.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

part 'return_entity.mapper.dart';

@MappableClass()
class ReturnEntity extends LoyaltyProgramEntity<ReturnEntity> with ReturnEntityMappable {
  final int numberHoles;
  final List<int> winningNumbers;

  ReturnEntity({
    required super.programId,
    required super.name,
    required this.numberHoles,
    required this.winningNumbers,
    required super.rewards,
    required super.lastingNumber,
    required super.lastingPeriod,
    super.startingDate,
    super.endDate,
    super.createdAt,
    super.updatedAt,
  }) : super(type: ProgramType.returning);

  @override
  ReturnEntity cloneWith({
    String? name,
    ProgramType? type,
    List<RewardEntity>? rewards,
    int? lastingNumber,
    TimeUnit? lastingPeriod,
    DateTime? startingDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReturnEntity(
      programId: programId,
      name: name ?? this.name,
      numberHoles: numberHoles,
      winningNumbers: winningNumbers,
      rewards: rewards ?? this.rewards,
      lastingNumber: lastingNumber ?? this.lastingNumber,
      lastingPeriod: lastingPeriod ?? this.lastingPeriod,
      startingDate: startingDate ?? this.startingDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [name, numberHoles, winningNumbers, ...super.props];
}
