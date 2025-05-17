import 'package:equatable/equatable.dart';

import '../../data/models/reward_model.dart';
import '../../services/helpers/discount_type_enum.dart';
import '../../services/helpers/reward_type_enum.dart';

class RewardEntity extends Equatable {
  final int? id;
  final RewardType? type;
  final int? discountValue;
  final DiscountType? discountType;
  final String? item;
  final String? description;
  final int? rewardCost;
  final int? minimumPurchase;

  const RewardEntity({
    this.id,
    this.type,
    this.discountValue,
    this.discountType,
    this.item,
    this.description,
    this.rewardCost,
    this.minimumPurchase,
  });

  RewardEntity copyWith({
    int? id,
    RewardType? type,
    int? discountValue,
    DiscountType? discountType,
    String? item,
    String? description,
    int? rewardCost,
    int? minimumPurchase,
  }) {
    return RewardEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      discountValue: discountValue ?? this.discountValue,
      discountType: discountType ?? this.discountType,
      item: item ?? this.item,
      description: description ?? this.description,
      rewardCost: rewardCost ?? this.rewardCost,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
    );
  }

  /// Convert Model to Entity
  factory RewardEntity.fromModel(RewardModel model) {
    return RewardEntity(
      id: model.id,
      type: RewardType.from(model.type),
      discountValue: model.discountValue,
      discountType: DiscountType.from(model.discountValueType),
      item: model.item,
      description: model.description,
      rewardCost: model.rewardCost,
      minimumPurchase: model.minimumPurchase,
    );
  }

  @override
  List<Object?> get props => [id, type, discountValue, discountType, item, description, rewardCost, minimumPurchase];
}
