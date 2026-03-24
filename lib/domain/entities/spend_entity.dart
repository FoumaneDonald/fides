import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../core/enums/time_units.dart';
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
    required super.validityMonth,
    super.note,
    super.createdAt,
    super.updatedAt,
  }) : super(type: ProgramType.spend);

  @override
  SpendEntity cloneWith({
    String? name,
    ProgramType? type,
    List<RewardEntity>? rewards,
    int? validityMonth,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SpendEntity(
      programId: programId,
      name: name ?? this.name,
      currencyCode: currencyCode,
      rewards: rewards ?? this.rewards,
      validityMonth: validityMonth ?? this.validityMonth,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory SpendEntity.init(String id) =>
      SpendEntity(
        programId: id,
        name: '',
        currencyCode: 'XAF',
        rewards: [],
        validityMonth: 1,
      );

  @override
  List<Object?> get props => [points, minimumSpent, currencyCode, ...super.props];
}
