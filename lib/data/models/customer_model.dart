import 'package:objectbox/objectbox.dart';

import 'loyalty_card.dart';
import '../../domain/entities/customer_entity.dart';

@Entity()
class CustomerModel {
  @Id()
  int id = 0;
  String customerId;
  String name;
  @Unique()
  String? phone;
  @Unique()
  String? email;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final cards = ToMany<LoyaltyCardModel>();

  CustomerModel({
    this.id = 0,
    required this.customerId,
    required this.name,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
  });


  CustomerModel copyWith({
    int? id = 0,
    String? customerId,
    String? name,
    String? phone,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  CustomerEntity toEntity() => CustomerEntity(
      customerId: customerId,
      name: name,
      phone: phone,
      email: email,
      cards: cards.map((card) => card.toEntity()).toList()
  );

  factory CustomerModel.fromEntity(CustomerEntity entity) {
    return CustomerModel(
      customerId: entity.customerId,
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
    );
  }

  static List<CustomerEntity> fromModelList(List<CustomerModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
