import 'package:fides/data/models/reward_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/returnEntity/return_entity.dart';
import 'customer_model.dart';

@Entity()
class ReturnModel {
  @Id()
  int? id = 0;
  String type;
  String name;
  int numberHoles;
  @Property(type: PropertyType.shortVector)
  List<int> winningNumbers;
  int lastingNumber;
  String lastingPeriod;
  @Property(type: PropertyType.date)
  DateTime? startingDate;
  @Property(type: PropertyType.date)
  DateTime? endDate;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  @Backlink('returnProgram')
  final rewards = ToMany<RewardModel>();
  @Backlink('returnPrograms')
  final customers = ToMany<CustomerModel>();

  ReturnModel({
    required this.id,
    required this.type,
    required this.name,
    required this.numberHoles,
    required this.winningNumbers,
    required this.lastingNumber,
    required this.lastingPeriod,
    this.startingDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  ReturnModel copyWith({
    int? id = 0,
    String? type,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
    int? lastingNumber,
    String? lastingPeriod,
    DateTime? startingDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReturnModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      numberHoles: numberHoles ?? this.numberHoles,
      winningNumbers: winningNumbers ?? this.winningNumbers,
      lastingNumber: lastingNumber ?? this.lastingNumber,
      lastingPeriod: lastingPeriod ?? this.lastingPeriod,
      startingDate: startingDate ?? this.startingDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  ///Convert Entity to Model
  factory ReturnModel.fromEntity(ReturnEntity entity) {
    final ReturnModel stampModel = ReturnModel(
      id: entity.id ?? 0,
      type: entity.type.label,
      name: entity.name,
      numberHoles: entity.numberHoles,
      winningNumbers: entity.winningNumbers,
      lastingNumber: entity.lastingNumber,
      lastingPeriod: entity.lastingPeriod.label,
      startingDate: entity.startingDate,
      endDate: entity.endDate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );

    // add rewards to stampModel
    stampModel.rewards.addAll(RewardModel.fromEntityList(entity.rewards));

    return stampModel;
  }

  /// Convert list of StampEntity to List of StampModel
  static List<ReturnModel> fromEntityList(List<ReturnEntity> models) {
    return models.map((model) => ReturnModel.fromEntity(model)).toList();
  }
}
