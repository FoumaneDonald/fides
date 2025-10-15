import 'package:dart_mappable/dart_mappable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../../core/enums/time_units.dart';
import '../../../data/models/return_model.dart';
import '../../../services/helpers/program_type_enum.dart';
import '../loyalty_program_entity.dart';

part 'return_entity.mapper.dart';

@MappableClass()
class ReturnEntity extends LoyaltyProgramEntity with ReturnEntityMappable {
  final int? id;
  final int numberHoles;
  final List<int> winningNumbers;

  ReturnEntity({
    this.id,
    required super.type,
    required super.name,
    required this.numberHoles,
    required this.winningNumbers,
    required super.rewards,
    required super.lastingNumber,
    required super.lastingPeriod,
    super.startingDate,
    super.endDate,
    super.createdAt,
    super.updatedAt,
  });

  @override
  LoyaltyProgramEntity cloneWith({
    String? name,
    ProgramType? type,
    List<RewardEntity>? rewards,
    int? lastingNumber,
    TimeUnit? lastingPeriod,
    DateTime? startingDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReturnEntity(
      type: type ?? this.type,
      name: name ?? this.name,
      numberHoles: numberHoles,
      winningNumbers: winningNumbers,
      rewards: rewards ?? this.rewards,
      lastingNumber: lastingNumber ?? this.lastingNumber,
      lastingPeriod: lastingPeriod ?? this.lastingPeriod,
      startingDate: startingDate ?? this.startingDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  ///Convert Model to Entity
  factory ReturnEntity.fromModel(ReturnModel model) {
    final List<RewardEntity> rewards = RewardEntity.fromModelList(model.rewards);

    return ReturnEntity(
      id: model.id ?? 0,
      type: ProgramType.from(model.type),
      name: model.name,
      numberHoles: model.numberHoles,
      winningNumbers: model.winningNumbers,
      rewards: rewards,
      lastingNumber: model.lastingNumber,
      lastingPeriod: TimeUnit.fromString(model.lastingPeriod),
      startingDate: model.startingDate,
      endDate: model.endDate,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static List<ReturnEntity> fromModelList(List<ReturnModel> models) {
    return models.map((model) => ReturnEntity.fromModel(model)).toList();
  }

  @override
  List<Object?> get props => [name, numberHoles, winningNumbers, ...super.props];
}
