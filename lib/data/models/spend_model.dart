// todo delete
// import 'package:fides/data/models/reward_model.dart';
// import 'package:objectbox/objectbox.dart';
//
// import '../../domain/entities/spendEntity/spend_entity.dart';
// import 'customer_model.dart';
//
// @Entity()
// class SpendModel {
//   @Id()
//   int? id = 0;
//   String type;
//   @Unique()
//   String name;
//   double points;
//   double minimumSpent;
//   String currencyCode;
//   int lastingNumber;
//   String lastingPeriod;
//   @Property(type: PropertyType.date)
//   DateTime? startingDate;
//   @Property(type: PropertyType.date)
//   DateTime? endDate;
//   @Property(type: PropertyType.date)
//   DateTime? createdAt = DateTime.now();
//   @Property(type: PropertyType.date)
//   DateTime? updatedAt;
//
//   @Backlink('spendProgram')
//   final rewards = ToMany<RewardModel>();
//   @Backlink('spendPrograms')
//   final customers = ToMany<CustomerModel>();
//
//   SpendModel({
//     required this.id,
//     required this.type,
//     required this.name,
//     required this.points,
//     required this.minimumSpent,
//     required this.currencyCode,
//     required this.lastingNumber,
//     required this.lastingPeriod,
//     this.startingDate,
//     this.endDate,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   SpendModel copyWith({
//     int? id = 0,
//     String? type,
//     String? name,
//     double? points,
//     double? minimumSpent,
//     String? currencyCode,
//     int? lastingNumber,
//     String? lastingPeriod,
//     DateTime? startingDate,
//     DateTime? endDate,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return SpendModel(
//       id: id ?? this.id,
//       type: type ?? this.type,
//       name: name ?? this.name,
//       points: points ?? this.points,
//       minimumSpent: minimumSpent ?? this.minimumSpent,
//       currencyCode: currencyCode ?? this.currencyCode,
//       lastingNumber: lastingNumber ?? this.lastingNumber,
//       lastingPeriod: lastingPeriod ?? this.lastingPeriod,
//       startingDate: startingDate ?? this.startingDate,
//       endDate: endDate ?? this.endDate,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }
//
//   ///Convert Entity to Model
//   factory SpendModel.fromEntity(SpendEntity entity) {
//     final SpendModel pointsModel = SpendModel(
//       id: entity.id ?? 0,
//       type: entity.type.label,
//       name: entity.name,
//       points: entity.points!,
//       minimumSpent: entity.minimumSpent!,
//       currencyCode: entity.currencyCode,
//       lastingNumber: entity.lastingNumber,
//       lastingPeriod: entity.lastingPeriod.label,
//       startingDate: entity.startingDate,
//       endDate: entity.endDate,
//       createdAt: entity.createdAt,
//       updatedAt: entity.updatedAt,
//     );
//
//     // add rewards
//     pointsModel.rewards.addAll(RewardModel.fromEntityList(entity.rewards));
//
//     return pointsModel;
//   }
//
//   /// Convert list of PointsEntity to List of PointsModel
//   static List<SpendModel> fromEntityList(List<SpendEntity> models) {
//     return models.map((model) => SpendModel.fromEntity(model)).toList();
//   }
// }
