import 'package:objectbox/objectbox.dart';

import '../../domain/entities/redemption_entity.dart';
import 'loyalty_card.dart';
import 'reward_model.dart';

@Entity()
class RedemptionModel {
  @Id()
  int id = 0;
  String redemptionId;
  int pointsSpent;

  @Property(type: PropertyType.date)
  DateTime date;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final card = ToOne<LoyaltyCardModel>();
  final reward = ToOne<RewardModel>();

  RedemptionModel({
    this.id = 0,
    required this.redemptionId,
    required this.pointsSpent,
    required this.date,
    this.createdAt,
    this.updatedAt,
  });

  RedemptionEntity toEntity() => RedemptionEntity(
        redemptionId: redemptionId,
        date: date,
        pointsSpent: pointsSpent,
        card: card.target!.toEntity(),
        reward: reward.target!.toEntity(),
      );

  static List<RedemptionEntity> fromModelList(List<RedemptionModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
