import 'package:objectbox/objectbox.dart';

import '../../domain/entities/reward_entity.dart';
import 'spend_model.dart';
import 'return_model.dart';

@Entity()
class RewardModel {
  @Id()
  int id = 0;
  String type;
  int? stampNumber;
  int? discountValue;
  String? discountValueType;
  String item;
  String imagePath;
  String description;
  int? rewardCost;
  int? minimumPurchase;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final spendProgram = ToOne<SpendModel>();
  final returnProgram = ToOne<ReturnModel>();

  RewardModel({
    required this.id,
    required this.type,
    this.stampNumber,
    this.discountValue,
    this.discountValueType,
    required this.item,
    required this.imagePath,
    required this.description,
    this.rewardCost,
    this.minimumPurchase,
    this.createdAt,
    this.updatedAt,
  });

  RewardModel copyWith({
    int? id,
    String? type,
    int? stampNumber,
    int? discountValue,
    String? discountValueType,
    String? item,
    String? imagePath,
    String? description,
    int? rewardCost,
    int? minimumPurchase,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RewardModel(
      id: id ?? this.id,
      type: type ?? this.type,
      stampNumber: stampNumber ?? this.stampNumber,
      discountValue: discountValue ?? this.discountValue,
      discountValueType: discountValueType ?? this.discountValueType,
      item: item ?? this.item,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      rewardCost: rewardCost ?? this.rewardCost,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      imagePath: entity.imagePath,
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
