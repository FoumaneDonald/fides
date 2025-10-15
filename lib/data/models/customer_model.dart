import 'package:equatable/equatable.dart';
import 'package:fides/data/models/spend_model.dart';
import 'package:fides/data/models/return_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/entities/spendEntity/spend_entity.dart';
import '../../domain/entities/returnEntity/return_entity.dart';

@Entity()
class CustomerModel {
  @Id()
  int id = 0;
  @Unique()
  String name;
  @Unique()
  String? phone;
  @Unique()
  String? email;

  final spendPrograms = ToMany<SpendModel>();
  final returnPrograms = ToMany<ReturnModel>();

  CustomerModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
  });

  CustomerModel copyWith({
    int? id = 0,
    String? name,
    String? phone,
    String? email,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  /// Convert [CustomerEntity] to [CustomerModel]
  factory CustomerModel.fromEntity(CustomerEntity entity) {
    final CustomerModel model = CustomerModel(
      id: entity.id ?? 0,
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
    );

    entity.loyaltyPrograms.map((program) {
      if (program is SpendEntity) {
        model.spendPrograms.add(SpendModel.fromEntity(program));
      } else if (program is ReturnEntity) {
        model.returnPrograms.add(ReturnModel.fromEntity(program));
      }
    });

    return model;
  }

  /// Convert list of [CustomerEntity] to List of [CustomerModel]
  static List<CustomerModel> fromEntityList(List<CustomerEntity> models) {
    return models.map((model) => CustomerModel.fromEntity(model)).toList();
  }
}
