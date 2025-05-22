import 'package:equatable/equatable.dart';
import 'package:fides/data/models/points_model.dart';
import 'package:fides/data/models/stamp_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/entities/points_entity.dart';
import '../../domain/entities/stamp_entity.dart';
import 'loyalty_program_model.dart';

@Entity()
class CustomerModel extends Equatable {
  @Id()
  int? id = 0;
  String? name;
  String? phone;
  String? email;

  final pointsPrograms = ToMany<PointsModel>();
  final stampPrograms = ToMany<StampModel>();

  CustomerModel({
    required this.id,
    this.name,
    this.phone,
    this.email,
  });

  CustomerModel copyWith({
    int? id = 0,
    String? name,
    String? phone,
    String? email,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  /// Convert [CustomerEntity] to [CustomerModel]
  factory CustomerModel.fromEntity(CustomerEntity entity) {
    final CustomerModel model = CustomerModel(
      id: entity.id ?? 0,
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
    );

    for (var program in entity.loyaltyPrograms!) {
      if( program is StampEntity ){
        model.stampPrograms.add(StampModel.fromEntity(program));
      } else if ( program is PointsEntity ){
        model.pointsPrograms.add(PointsModel.fromEntity(program));
      }
    }

    return model;
  }

  @override
  List<Object?> get props => [id, name, phone, email];
}
