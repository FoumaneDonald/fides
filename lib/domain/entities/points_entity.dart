import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../data/models/points_model.dart';
import '../../services/helpers/program_type_enum.dart';
import 'loyalty_program_entity.dart';

class PointsEntity extends LoyaltyProgramEntity {
  final int? id;
  @override
  final String? name;
  @override
  final ProgramType type;
  final double? points;
  final double? minimumSpent;
  final String currencyCode;
  @override
  final List<RewardEntity> rewards;

  PointsEntity({
    this.id,
    required this.type,
    this.name,
    this.points,
    this.minimumSpent,
    required this.currencyCode,
    required this.rewards,
  });

  @override
  PointsEntity copyWith({
    int? id,
    ProgramType? type,
    String? name,
    double? points,
    double? minimumSpent,
    String? currencyCode,
    List<RewardEntity>? rewards,
  }) {
    return PointsEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      points: points ?? this.points,
      minimumSpent: minimumSpent ?? this.minimumSpent,
      currencyCode: currencyCode ?? this.currencyCode,
      rewards: rewards ?? this.rewards,
    );
  }

  ///Convert Model to Entity
  factory PointsEntity.fromModel(PointsModel model) {
    return PointsEntity(
      id: model.id ?? 0,
      type: ProgramType.from(model.type),
      name: model.name,
      points: model.points,
      minimumSpent: model.minimumSpent,
      currencyCode: model.currencyCode,
      rewards: RewardEntity.fromModelList(model.rewards),
    );
  }

  static List<PointsEntity> fromModelList(List<PointsModel> models) {
    return models.map((model) => PointsEntity.fromModel(model)).toList();
  }

  @override
  List<Object?> get props => [...super.props, points, minimumSpent, currencyCode];
}
