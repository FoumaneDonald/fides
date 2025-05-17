import 'package:fides/data/models/reward_model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/stamp_entity.dart';
import 'customer_model.dart';

@Entity()
class StampModel {
  @Id()
  int? id = 0;
  String type;
  String name;
  int numberHoles;
  @Property(type: PropertyType.shortVector)
  List<int> winningNumbers;

  @Backlink('stampProgram')
  final rewards = ToMany<RewardModel>();
  @Backlink('stampPrograms')
  final customers = ToMany<CustomerModel>();

  StampModel({
    required this.id,
    required this.type,
    required this.name,
    required this.numberHoles,
    required this.winningNumbers,
  });

  StampModel copyWith({
    int? id = 0,
    String? type,
    String? name,
    int? numberHoles,
    List<int>? winningNumbers,
  }) {
    return StampModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      numberHoles: numberHoles ?? this.numberHoles,
      winningNumbers: winningNumbers ?? this.winningNumbers,
    );
  }

  ///Convert Entity to Model
  factory StampModel.fromEntity(StampEntity entity) {
    return StampModel(
      id: entity.id ?? 0,
      type: entity.type.label,
      name: entity.name!,
      numberHoles: entity.numberHoles,
      winningNumbers: entity.winningNumbers,
    );
  }
}
