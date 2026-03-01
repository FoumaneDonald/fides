import 'package:dart_mappable/dart_mappable.dart';

part 'business_entity.mapper.dart';

@MappableClass()
class BusinessEntity with BusinessEntityMappable {
  final String businessId;
  final String name;
  final String email;
  final int phoneNumber;

  BusinessEntity({
    required this.businessId,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
