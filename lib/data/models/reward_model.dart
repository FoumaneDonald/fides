import 'package:objectbox/objectbox.dart';

import '../../domain/entities/reward_entity.dart';
import '../../services/helpers/discount_type_enum.dart';
import '../../services/helpers/reward_type_enum.dart';
import 'loyalty_program.dart';

@Entity()
class RewardModel {
  @Id()
  int id = 0;
  String rewardId;
  String type;
  int unlockThreshold;
  // Specific to "Spend Program". Min purchase or min unlockThreshold to
  int? minimumPurchase;

  // common fields
  int? discountValue;
  String? discountValueType;
  String item;
  String imagePath;
  String description;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final program = ToOne<LoyaltyProgramModel>();

  RewardModel({
    this.id = 0,
    required this.rewardId,
    required this.type,
    required this.unlockThreshold,
    this.discountValue,
    this.discountValueType,
    required this.item,
    required this.imagePath,
    required this.description,
    this.minimumPurchase,
    this.createdAt,
    this.updatedAt,
  });

  RewardModel copyWith({
    int? id,
    String? rewardId,
    String? type,
    int? unlockThreshold,
    int? discountValue,
    String? discountValueType,
    String? item,
    String? imagePath,
    String? description,
    int? minimumPurchase,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RewardModel(
      id: id ?? this.id,
      rewardId: rewardId ?? this.rewardId,
      type: type ?? this.type,
      unlockThreshold: unlockThreshold ?? this.unlockThreshold,
      discountValue: discountValue ?? this.discountValue,
      discountValueType: discountValueType ?? this.discountValueType,
      item: item ?? this.item,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Dans RewardModel
  RewardEntity toEntity() {
    return RewardEntity(
      rewardId: rewardId,
      type: RewardType.from(type),
      unlockThreshold: unlockThreshold,
      discountValue: discountValue,
      discountType: DiscountType.from(discountValueType),
      item: item,
      imagePath: imagePath,
      description: description,
      minimumPurchase: minimumPurchase,
    );
  }

  factory RewardModel.fromEntity(RewardEntity entity) {
    return RewardModel(
      rewardId: entity.rewardId,
      type: entity.type.label,
      unlockThreshold: entity.unlockThreshold,
      discountValue: entity.discountValue,
      discountValueType: entity.discountType?.label,
      item: entity.item,
      imagePath: entity.imagePath,
      description: entity.description,
      minimumPurchase: entity.minimumPurchase,
    );
  }

  static List<RewardEntity> fromModelList(List<RewardModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
