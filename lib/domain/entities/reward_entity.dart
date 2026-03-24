import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/reward_model.dart';
import '../../services/helpers/discount_type_enum.dart';
import '../../services/helpers/reward_type_enum.dart';

part 'reward_entity.mapper.dart';

@MappableClass()
class RewardEntity extends Equatable with RewardEntityMappable {
  final String rewardId;
  final RewardType type;
  final int unlockThreshold;
  final int? discountValue;
  final DiscountType? discountType;
  final String item;
  final String imagePath;
  final String description;
  final int? minimumPurchase;

  const RewardEntity({
    required this.rewardId,
    required this.type,
    required this.unlockThreshold,
    this.discountValue,
    this.discountType,
    required this.item,
    required this.imagePath,
    required this.description,
    this.minimumPurchase,
  });

  @override
  List<Object?> get props => [rewardId, type, unlockThreshold, discountValue, discountType, item, imagePath, description, minimumPurchase];
}
