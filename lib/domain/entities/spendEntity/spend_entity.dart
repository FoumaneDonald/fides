import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../../core/enums/time_units.dart';
import '../../../data/models/spend_model.dart';
import '../../../services/helpers/program_type_enum.dart';
import '../loyalty_program_entity.dart';

part 'spend_entity.mapper.dart';

@MappableClass()
class SpendEntity extends LoyaltyProgramEntity with SpendEntityMappable {
  final int? id;
  final double? points;
  final double? minimumSpent;
  final String currencyCode;

  SpendEntity({
    this.id,
    required super.type,
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
  });

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
      name: name ?? this.name,
      type: type ?? this.type,
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

  ///Convert Model to Entity
  factory SpendEntity.fromModel(SpendModel model) {
    return SpendEntity(
      id: model.id ?? 0,
      type: ProgramType.from(model.type),
      name: model.name,
      points: model.points,
      minimumSpent: model.minimumSpent,
      currencyCode: model.currencyCode,
      rewards: RewardEntity.fromModelList(model.rewards),
      lastingNumber: model.lastingNumber,
      lastingPeriod: TimeUnit.fromString(model.lastingPeriod),
      startingDate: model.startingDate,
      endDate: model.endDate,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static List<SpendEntity> fromModelList(List<SpendModel> models) {
    return models.map((model) => SpendEntity.fromModel(model)).toList();
  }

  @override
  List<Object?> get props => [points, minimumSpent, currencyCode, ...super.props];
}
