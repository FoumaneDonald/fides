import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import 'loyalty_card_entity.dart';

part 'transaction_entity.mapper.dart';

@MappableClass()
class TransactionEntity with TransactionEntityMappable {
  final String transactionId;
  final double amount;
  final DateTime date;
  final LoyaltyCardEntity card;

  TransactionEntity({
    required this.transactionId,
    required this.amount,
    required this.date,
    required this.card,
  });
}
