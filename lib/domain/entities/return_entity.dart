import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../core/enums/time_units.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

part 'return_entity.mapper.dart';

@MappableClass()
class ReturnEntity extends LoyaltyProgramEntity<ReturnEntity> with ReturnEntityMappable {
  final int totalReturns;
  final List<int> rewardingReturns;

  ReturnEntity({
    required super.programId,
    required super.name,
    required super.validityMonth,
    required this.totalReturns,
    required this.rewardingReturns,
    required super.rewards,
    super.note,
    super.createdAt,
    super.updatedAt,
  }) : super(type: ProgramType.returning);

  @override
  ReturnEntity cloneWith({
    String? name,
    ProgramType? type,
    List<RewardEntity>? rewards,
    int? validityMonth,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReturnEntity(
      programId: programId,
      name: name ?? this.name,
      totalReturns: totalReturns,
      rewardingReturns: rewardingReturns,
      rewards: rewards ?? this.rewards,
      validityMonth: validityMonth ?? this.validityMonth,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ReturnEntity.init(String id) => ReturnEntity(
        programId: id,
        name: '',
        totalReturns: 5,
        rewardingReturns: [3, 5],
        rewards: [],
        validityMonth: 1,
      );

  @override
  List<Object?> get props => [name, totalReturns, rewardingReturns, ...super.props];
}
