import 'package:dart_mappable/dart_mappable.dart';

import 'customer_entity.dart';
import 'loyalty_program_entity.dart';

part 'loyalty_card_entity.mapper.dart';

@MappableClass()
class LoyaltyCardEntity with LoyaltyCardEntityMappable {
  final String cardId;
  final int balance;
  final CustomerEntity? customer;
  final LoyaltyProgramEntity? program;
  final DateTime startDate;
  final DateTime endDate;

  LoyaltyCardEntity({
    required this.cardId,
    required this.balance,
    this.customer,
    this.program,
    required this.startDate,
    required this.endDate,
  });
}
