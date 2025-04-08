import 'package:fides/data/entities/loyaltyProgramEntity.dart';
import 'package:result_dart/result_dart.dart';

import '../entities/rewardEntity.dart';

abstract class LoyaltyProgramRepository {
  Future<Result<LoyaltyProgramEntity>> createLoyaltyProgram({required LoyaltyProgramEntity loyaltyProgramEntity, required RewardEntity reward});
  Future<Result<List<LoyaltyProgramEntity>>> getLoyaltyProgram();
}
