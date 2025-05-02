import 'package:result_dart/result_dart.dart';

import '../entities/loyalty_program_entity.dart';
import '../entities/reward_entity.dart';


abstract class LoyaltyProgramRepository {
  Future<Result<LoyaltyProgramEntity>> createLoyaltyProgram({required LoyaltyProgramEntity loyaltyProgramEntity, required List<RewardEntity> rewardList});
  Future<Result<List<LoyaltyProgramEntity>>> getLoyaltyProgram();
  List<LoyaltyProgramEntity> get existingPrograms;
}
