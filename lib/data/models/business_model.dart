import 'package:objectbox/objectbox.dart';

import '../../domain/entities/business_entity.dart';
import 'loyalty_program.dart';

@Entity()
class BusinessModel {
  @Id()
  int id = 0;
  String businessId;
  String name;
  @Unique()
  String email;
  @Unique()
  int phoneNumber;
  @Property(type: PropertyType.date)
  DateTime? createdAt = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final programs = ToMany<LoyaltyProgramModel>();

  BusinessModel({
    this.id = 0,
    required this.businessId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  BusinessEntity toEntity() {
    return BusinessEntity(
      businessId: businessId,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  factory BusinessModel.fromEntity(BusinessEntity entity) {
    return BusinessModel(
      businessId: entity.businessId,
      name: entity.name,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
    );
  }

  static List<BusinessEntity> fromModelList(List<BusinessModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
