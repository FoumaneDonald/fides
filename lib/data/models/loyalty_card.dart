import 'package:objectbox/objectbox.dart';

import '../../domain/entities/loyalty_card_entity.dart';
import 'customer_model.dart';
import 'loyalty_program.dart';
import 'redemption_model.dart';
import 'transaction_model.dart';

@Entity()
class LoyaltyCardModel {
  @Id()
  int id = 0;
  String cardId;
  int balance = 0;
  // Date client was added to program
  @Property(type: PropertyType.date)
  DateTime startDate;
  @Property(type: PropertyType.date)
  DateTime endDate;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final customer = ToOne<CustomerModel>();
  final program = ToOne<LoyaltyProgramModel>();

  @Backlink('card')
  final transactions = ToMany<TransactionModel>();
  @Backlink('card')
  final redemptions = ToMany<RedemptionModel>();

  LoyaltyCardModel({
    this.id = 0,
    required this.cardId,
    required this.startDate,
    required this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  LoyaltyCardEntity toEntity() {
    return LoyaltyCardEntity(
      cardId: cardId,
      balance: balance,
      startDate: startDate,
      endDate: endDate,
      // On convertit les relations si elles sont chargées
      customer: customer.target?.toEntity(),
      program: program.target?.toEntity(),
    );
  }

  factory LoyaltyCardModel.fromEntity(LoyaltyCardEntity entity) {
    final model = LoyaltyCardModel(
      cardId: entity.cardId,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
    model.balance = entity.balance;
    return model;
  }

  static List<LoyaltyCardEntity> fromModelList(List<LoyaltyCardModel> models) {
    return models.map((m) => m.toEntity()).toList();
  }

  bool get isExpired => DateTime.now().isAfter(endDate);
}