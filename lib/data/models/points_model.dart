import 'package:fides/data/models/reward_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/points_entity.dart';
import 'customer_model.dart';

@Entity()
class PointsModel {
  @Id()
  int? id = 0;
  @Unique()
  String? uid;
  String type;
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
    this.uid,
    required this.type,
    required this.name,
    required this.points,
    required this.minimumSpent,
    required this.currencyCode,
  });

  PointsModel copyWith({
    int? id = 0,
    String? uid,
    String? type,
    String? name,
    double? points,
    double? minimumSpent,
    String? currencyCode,
  }) {
    return PointsModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      name: name ?? this.name,
      points: points ?? this.points,
      minimumSpent: minimumSpent ?? this.minimumSpent,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  ///Convert Entity to Model
  factory PointsModel.fromEntity(PointsEntity entity) {
    return PointsModel(
      id: entity.id ?? 0,
      uid: entity.uid,
      type: entity.type!.label,
      name: entity.name!,
      points: entity.points!,
      minimumSpent: entity.minimumSpent!,
      currencyCode: entity.currencyCode!,
    );
  }
}
