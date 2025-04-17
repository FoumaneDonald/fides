import 'package:equatable/equatable.dart';

import '../../data/models/reward_model.dart';
import '../../services/helpers/discount_type_enum.dart';
import '../../services/helpers/reward_type_enum.dart';


class Value<T> {
  final T value;
  const Value(this.value);
}

class RewardEntity extends Equatable {
  final int? id;
  final String? uid;
  final RewardType? type;
  final int? discountValue;
  final DiscountType? discountType;
  final String? item;
  final String? description;
  final int? rewardCost;
  final int? minimumPurchase;

  const RewardEntity({
    this.id,
    this.uid,
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
    String? uid,
    RewardType? type,
    Value<int?>? discountValue,
    Value<DiscountType?>? discountType,
    String? item,
    String? description,
    Value<int?>? rewardCost,
    int? minimumPurchase,
  }) {
    return RewardEntity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      discountValue: discountValue != null ? discountValue.value : this.discountValue,
      discountType: discountType != null ? discountType.value : this.discountType,
      item: item ?? this.item,
      description: description ?? this.description,
      rewardCost: rewardCost != null ? rewardCost.value : this.rewardCost,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
    );
  }

  /// Convert Model to Entity
  factory RewardEntity.fromModel(RewardModel model) {
    return RewardEntity(
      id: model.id,
      uid: model.uid,
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
  List<Object?> get props => [id, uid, type, discountValue, discountType, item, description, rewardCost, minimumPurchase];
}
