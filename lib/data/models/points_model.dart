import 'package:fides/data/models/reward_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/points_entity.dart';
import 'customer_model.dart';

@Entity()
class PointsModel {
  @Id()
  int? id = 0;
  String type;
  @Unique()
  String name;
  double points;
  double minimumSpent;
  String currencyCode;

  @Backlink('pointsProgram')
  final rewards = ToMany<RewardModel>();
  @Backlink('pointsPrograms')
  final customers = ToMany<CustomerModel>();

  PointsModel({
    required this.id,
    required this.type,
    required this.name,
    required this.points,
    required this.minimumSpent,
    required this.currencyCode,
  });

  PointsModel copyWith({
    int? id = 0,
    String? type,
    String? name,
    double? points,
    double? minimumSpent,
    String? currencyCode,
  }) {
    return PointsModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      points: points ?? this.points,
      minimumSpent: minimumSpent ?? this.minimumSpent,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  ///Convert Entity to Model
  factory PointsModel.fromEntity(PointsEntity entity) {
    final PointsModel pointsModel = PointsModel(
      id: entity.id ?? 0,
      type: entity.type.label,
      name: entity.name!,
      points: entity.points!,
      minimumSpent: entity.minimumSpent!,
      currencyCode: entity.currencyCode,
    );

    // add rewards
    pointsModel.rewards.addAll(RewardModel.fromEntityList(entity.rewards));
    
    return pointsModel;
  }

  /// Convert list of PointsEntity to List of PointsModel
  static List<PointsModel> fromEntityList(List<PointsEntity> models) {
    return models.map((model) => PointsModel.fromEntity(model)).toList();
  }
}
