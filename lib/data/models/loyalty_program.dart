import 'package:objectbox/objectbox.dart';

import '../../core/enums/time_units.dart';
import '../../domain/entities/loyalty_program_entity.dart';
import '../../domain/entities/return_entity.dart';
import '../../domain/entities/spend_entity.dart';
import '../../services/helpers/program_type_enum.dart';
import 'business_model.dart';
import 'reward_model.dart';

@Entity()
class LoyaltyProgramModel {
  @Id()
  int id = 0;
  String programId;
  String name;
  String type;

  int lastingNumber;
  String lastingPeriod;

  @Property(type: PropertyType.date)
  DateTime? startingDate;
  @Property(type: PropertyType.date)
  DateTime? endDate;

  int? maximumReturn;
  List<int>? rewardedReturn;

  double? points;
  double? minimumSpent;
  String? currencyCode;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final rewards = ToMany<RewardModel>();
  final business = ToOne<BusinessModel>();

  LoyaltyProgramModel({
    this.id = 0,
    required this.programId,
    required this.name,
    required this.type,
    required this.lastingNumber,
    required this.lastingPeriod,
    this.startingDate,
    this.endDate,
    this.maximumReturn,
    this.rewardedReturn,
    this.points,
    this.minimumSpent,
    this.currencyCode,
    this.createdAt,
    this.updatedAt,
  });

  LoyaltyProgramEntity toEntity() {
    final baseRewards = RewardModel.fromModelList(rewards);
    final period = TimeUnit.fromString(lastingPeriod);
    final programType = ProgramType.fromString(type) ;

    if (programType == ProgramType.returning) {
      return ReturnEntity(
        programId: programId,
        name: name,
        numberHoles: maximumReturn ?? 0,
        winningNumbers: rewardedReturn ?? [],
        rewards: baseRewards,
        lastingNumber: lastingNumber,
        lastingPeriod: period,
        startingDate: startingDate,
        endDate: endDate,
      );
    } else {
      return SpendEntity(
        programId: programId,
        name: name,
        points: points,
        minimumSpent: minimumSpent,
        currencyCode: currencyCode!,
        rewards: baseRewards,
        lastingNumber: lastingNumber,
        lastingPeriod: period,
        startingDate: startingDate,
        endDate: endDate,
      );
    }
  }

  factory LoyaltyProgramModel.fromEntity(LoyaltyProgramEntity entity) {
    if (entity is ReturnEntity) {
      return LoyaltyProgramModel(
        programId: entity.programId,
        name: entity.name,
        type: entity.type.label,
        lastingNumber: entity.lastingNumber,
        lastingPeriod: entity.lastingPeriod.name,
        startingDate: entity.startingDate,
        endDate: entity.endDate,
        maximumReturn: entity.numberHoles,
        rewardedReturn: entity.winningNumbers,
      );
    } else if (entity is SpendEntity) {
      return LoyaltyProgramModel(
        programId: entity.programId,
        name: entity.name,
        type: entity.type.label,
        lastingNumber: entity.lastingNumber,
        lastingPeriod: entity.lastingPeriod.name,
        startingDate: entity.startingDate,
        endDate: entity.endDate,
        points: entity.points,
        minimumSpent: entity.minimumSpent,
        currencyCode: entity.currencyCode,
      );
    }
    throw Exception("Unknown Entity Type");
  }

  static List<LoyaltyProgramEntity> fromModelList(List<LoyaltyProgramModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
