import 'package:fides/data/models/reward_model.dart';

abstract class LoyaltyProgramModel {
  int id;
  String name;
  List<RewardModel> get rewards;

  LoyaltyProgramModel({
    required this.id,
    required this.name,
  });
}
