import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../core/enums/time_units.dart';
import '../../data/models/loyalty_program.dart';
import '../../data/models/spend_model.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

part 'spend_entity.mapper.dart';

@MappableClass()
class SpendEntity extends LoyaltyProgramEntity<SpendEntity> with SpendEntityMappable {
  final double? points;
  final double? minimumSpent;
  final String currencyCode;

  SpendEntity({
    required super.programId,
    required super.name,
    this.points,
    this.minimumSpent,
    required this.currencyCode,
    required super.rewards,
    required super.lastingNumber,
    required super.lastingPeriod,
    super.startingDate,
    super.endDate,
    super.createdAt,
    super.updatedAt,
  }) : super(type: ProgramType.spend);

  @override
  SpendEntity cloneWith({
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
    return SpendEntity(
      programId: programId,
      name: name ?? this.name,
      currencyCode: currencyCode,
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
  List<Object?> get props => [points, minimumSpent, currencyCode, ...super.props];
}
