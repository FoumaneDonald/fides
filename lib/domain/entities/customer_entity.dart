import 'package:equatable/equatable.dart';

import '../../data/models/customer_model.dart';
import 'loyalty_program_entity.dart';

//Todo: Add the relation between [LoyaltyProgramEntity] and [CustomerEntity]
class CustomerEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? phone;
  final String? email;
  final List<LoyaltyProgramEntity>? loyaltyPrograms;

  const CustomerEntity({
    this.id,
    this.uid,
    this.name,
    this.phone,
    this.email,
    this.loyaltyPrograms,
  });

  CustomerEntity copyWith({
    int? id,
    String? uid,
    String? name,
    String? phone,
    String? email,
    List<LoyaltyProgramEntity>? loyaltyPrograms,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      loyaltyPrograms: loyaltyPrograms ?? this.loyaltyPrograms,
    );
  }

  /// Convert [CustomerModel] to [CustomerEntity]
  factory CustomerEntity.fromModel(CustomerModel model) {
    return CustomerEntity(
      id: model.id,
      uid: model.uid,
      name: model.name,
      phone: model.phone,
      email: model.email,
    );
  }

  @override
  List<Object?> get props => [id, uid, name, phone, email, loyaltyPrograms];
}
