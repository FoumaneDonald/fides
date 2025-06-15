import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/points_entity.dart';
import 'package:fides/domain/entities/stamp_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/customer_model.dart';
import 'loyalty_program_entity.dart';

part 'customer_entity.freezed.dart';

@freezed
abstract class CustomerEntity with _$CustomerEntity {
  const CustomerEntity._();

  const factory CustomerEntity({
    int? id,
    @Default('') String name,
    String? phone,
    String? email,
    @Default([]) List<LoyaltyProgramEntity> loyaltyPrograms,
  }) = _CustomerEntity;

  factory CustomerEntity.empty() => CustomerEntity(name: '', loyaltyPrograms: const []);

  /// Convert [CustomerModel] to [CustomerEntity]
  factory CustomerEntity.fromModel(CustomerModel model) {
    final List<LoyaltyProgramEntity> programs = [
      ...StampEntity.fromModelList(model.stampPrograms),
      ...PointsEntity.fromModelList(model.pointsPrograms),
    ];

    return CustomerEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      email: model.email,
      loyaltyPrograms: programs,
    );
  }

  static List<CustomerEntity> fromModelList(List<CustomerModel> models) {
    return models.map((model) => CustomerEntity.fromModel(model)).toList();
  }
}
