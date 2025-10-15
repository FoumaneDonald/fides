import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/spendEntity/spend_entity.dart';
import 'package:fides/domain/entities/returnEntity/return_entity.dart';

import '../../data/models/customer_model.dart';
import 'loyalty_program_entity.dart';

part 'customer_entity.mapper.dart';

@MappableClass()
class CustomerEntity with CustomerEntityMappable {
  final int? id;
  final String name;
  final String? phone;
  final String? email;
  final List<LoyaltyProgramEntity> loyaltyPrograms;

  const CustomerEntity({
    this.id,
    required this.name,
    this.phone,
    this.email,
    required this.loyaltyPrograms,
  });

  factory CustomerEntity.empty() => CustomerEntity(name: '', loyaltyPrograms: const []);

  /// Convert [CustomerModel] to [CustomerEntity]
  factory CustomerEntity.fromModel(CustomerModel model) {
    final List<LoyaltyProgramEntity> programs = [
      ...ReturnEntity.fromModelList(model.returnPrograms),
      ...SpendEntity.fromModelList(model.spendPrograms),
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
