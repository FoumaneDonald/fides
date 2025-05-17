import 'package:equatable/equatable.dart';
import 'package:fides/data/models/points_model.dart';
import 'package:fides/data/models/stamp_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/customer_entity.dart';
import 'loyalty_program_model.dart';

@Entity()
class CustomerModel extends Equatable {
  @Id()
  int? id = 0;
  @Unique()
  String? uid;
  String? name;
  String? phone;
  String? email;

  final pointsPrograms = ToMany<PointsModel>();
  final stampPrograms = ToMany<StampModel>();

  CustomerModel({
    required this.id,
    this.uid,
    this.name,
    this.phone,
    this.email,
  });

  CustomerModel copyWith({
    int? id = 0,
    String? uid,
    String? name,
    String? phone,
    String? email,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  /// Convert [CustomerEntity] to [CustomerModel]
  factory CustomerModel.fromEntity(CustomerEntity model) {
    return CustomerModel(
      id: model.id ?? 0,
      uid: model.uid,
      name: model.name,
      phone: model.phone,
      email: model.email,
    );
  }

  @override
  List<Object?> get props => [id, uid, name, phone, email];
}
