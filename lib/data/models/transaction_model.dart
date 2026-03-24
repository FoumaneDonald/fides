
import 'package:objectbox/objectbox.dart';

import 'loyalty_card.dart';

@Entity()
class TransactionModel {
  @Id()
  int id = 0;
  String transactionId;
  double amount;
  int pointsEarned;
  @Property(type: PropertyType.date)
  DateTime date;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final card = ToOne<LoyaltyCardModel>();

  TransactionModel({
    this.id = 0,
    required this.transactionId,
    required this.amount,
    required this.pointsEarned,
    required this.date,
    this.createdAt,
    this.updatedAt,
  });
}