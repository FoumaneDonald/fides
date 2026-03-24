import 'package:dart_mappable/dart_mappable.dart';

import 'loyalty_card_entity.dart';

part 'customer_entity.mapper.dart';

@MappableClass()
class CustomerEntity with CustomerEntityMappable {
  final String customerId;
  final String name;
  final String? phone;
  final String? email;
  final List<LoyaltyCardEntity> cards;

  const CustomerEntity({
    required this.customerId,
    required this.name,
    this.phone,
    this.email,
    required this.cards,
  });

  factory CustomerEntity.empty() => const CustomerEntity(customerId: '', name: '', cards: []);
}
