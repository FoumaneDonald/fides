import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/points_entity.dart';
import 'package:fides/domain/entities/stamp_entity.dart';

import '../../data/models/customer_model.dart';
import 'loyalty_program_entity.dart';

class CustomerEntity extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final List<LoyaltyProgramEntity>? loyaltyPrograms;

  const CustomerEntity({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.loyaltyPrograms,
  });

  CustomerEntity copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    List<LoyaltyProgramEntity>? loyaltyPrograms,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      loyaltyPrograms: loyaltyPrograms ?? this.loyaltyPrograms,
    );
  }

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

  @override
  List<Object?> get props => [id, name, phone, email, loyaltyPrograms];
}
