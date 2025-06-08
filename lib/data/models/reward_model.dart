import 'package:objectbox/objectbox.dart';

import '../../domain/entities/reward_entity.dart';
import 'points_model.dart';
import 'stamp_model.dart';

@Entity()
class RewardModel {
  @Id()
  int id = 0;
  String? type;
  int? stampNumber;
  int? discountValue;
  String? discountValueType;
  String? item;
  String? description;
  int? rewardCost;
  int? minimumPurchase;

  final pointsProgram = ToOne<PointsModel>();
  final stampProgram = ToOne<StampModel>();

  RewardModel({
    required this.id,
    this.type,
    this.stampNumber,
    this.discountValue,
    this.discountValueType,
    this.item,
    this.description,
    this.rewardCost,
    this.minimumPurchase,
  });

  RewardModel copyWith({
    int? id,
    String? type,
    int? stampNumber,
    int? discountValue,
    String? discountValueType,
    String? item,
    String? description,
    int? rewardCost,
    int? minimumPurchase,
  }) {
    return RewardModel(
      id: id ?? this.id,
      type: type ?? this.type,
      stampNumber: stampNumber ?? this.stampNumber,
      discountValue: discountValue ?? this.discountValue,
      discountValueType: discountValueType ?? this.discountValueType,
      item: item ?? this.item,
      description: description ?? this.description,
      rewardCost: rewardCost ?? this.rewardCost,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
    );
  }

  /// Convert Entity to Model
  factory RewardModel.fromEntity(RewardEntity entity) {
    return RewardModel(
      id: entity.id ?? 0,
      type: entity.type.label,
      stampNumber: entity.stampNumber,
      discountValue: entity.discountValue,
      discountValueType: entity.discountType?.label,
      item: entity.item,
      description: entity.description,
      rewardCost: entity.rewardCost,
      minimumPurchase: entity.minimumPurchase,
    );
  }

  /// Convert list of RewardEntity to List of RewardModel
  static List<RewardModel> fromEntityList(List<RewardEntity> models) {
    return models.map((model) => RewardModel.fromEntity(model)).toList();
  }
}
