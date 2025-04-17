import 'package:fides/domain/entities/loyalty_program_entity.dart';
import 'package:fides/data/models/reward_model.dart';
import 'package:objectbox/objectbox.dart';

import 'customer_model.dart';
@Entity()
class LoyaltyProgramModel {
  @Id()
  int? id = 0;
  @Unique()
  String? uid;
  String? type;
  String? name;
  String? pointValue;
  int? numberHoles;
  @Property(type: PropertyType.shortVector)
  List<int>? winningNumbers;

  @Backlink('loyaltyProgram')
  final rewards = ToMany<RewardModel>();
  @Backlink('loyaltyPrograms')
  final customers = ToMany<CustomerModel>();

  LoyaltyProgramModel({
    required this.id,
    this.uid,
    this.type,
    this.name,
    this.pointValue,
    this.numberHoles,
    this.winningNumbers,
  });

  LoyaltyProgramModel copyWith({
    int? id = 0,
    String? uid,
    String? type,
    String? name,
    String? pointValue,
    int? numberHoles,
    List<int>? winningNumbers,
  }) {
    return LoyaltyProgramModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      name: name ?? this.name,
      pointValue: pointValue ?? this.pointValue,
      numberHoles: numberHoles ?? this.numberHoles,
      winningNumbers: winningNumbers ?? this.winningNumbers,
    );
  }

  ///Convert Entity to Model
  factory LoyaltyProgramModel.fromEntity(LoyaltyProgramEntity entity) {
    return LoyaltyProgramModel(
      id: entity.id ?? 0,
      uid: entity.uid,
      type: entity.type,
      name: entity.name,
      pointValue: entity.pointValue,
      numberHoles: entity.numberHoles,
      winningNumbers: entity.winningNumbers,
    );
  }
}
