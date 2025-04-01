import 'package:equatable/equatable.dart';

import '../../domain/models/rewardModel.dart';

class Value<T> {
  final T value;
  const Value(this.value);
}

class RewardEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? type;
  final int? discountValue;
  final String? discountType;
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
    String? type,
    Value<int?>? discountValue,
    Value<String?>? discountType,
    String? item,
    String? description,
    int? rewardCost,
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
      rewardCost: rewardCost ?? this.rewardCost,
      minimumPurchase: minimumPurchase ?? this.minimumPurchase,
    );
  }

  /// Convert Model to Entity
  factory RewardEntity.fromModel(RewardModel model) {
    return RewardEntity(
      id: model.id,
      uid: model.uid,
      type: model.type,
      discountValue: model.discountValue,
      discountType: model.discountValueType,
      item: model.item,
      description: model.description,
      rewardCost: model.rewardCost,
      minimumPurchase: model.minimumPurchase,
    );
  }

  @override
  List<Object?> get props => [id, uid, type, discountValue, discountType, item, description, rewardCost, minimumPurchase];
}
