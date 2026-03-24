import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import 'loyalty_card_entity.dart';

part 'redemption_entity.mapper.dart';

@MappableClass()
class RedemptionEntity with RedemptionEntityMappable {
  final String redemptionId;
  final DateTime date;
  final int pointsSpent;
  final LoyaltyCardEntity card;
  final RewardEntity reward;

  RedemptionEntity({
    required this.redemptionId,
    required this.date,
    required this.pointsSpent,
    required this.card,
    required this.reward,
  });
}
