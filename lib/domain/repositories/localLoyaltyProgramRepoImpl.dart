import 'package:fides/data/entities/rewardEntity.dart';
import 'package:fides/domain/models/loyaltyProgramModel.dart';
import 'package:fides/domain/models/rewardModel.dart';
import 'package:result_dart/result_dart.dart';

import '../../data/entities/loyaltyProgramEntity.dart';
import '../../data/repositories/LoyaltyProgramRepository.dart';
import '../../services/loyaltyProgramDao.dart';

class LocalLoyaltyProgramRepoImpl implements LoyaltyProgramRepository {
  final LoyaltyProgramDao rewardDao;

  LocalLoyaltyProgramRepoImpl(this.rewardDao);

  @override
  Future<Result<LoyaltyProgramEntity>> createLoyaltyProgram({required LoyaltyProgramEntity loyaltyProgramEntity, required RewardEntity reward}) async {
    final result = rewardDao.create(
      LoyaltyProgramModel.fromEntity(loyaltyProgramEntity),
      RewardModel.fromEntity(reward),
    );
    return result.fold(
      (loyaltyProgram) {
        return Success(LoyaltyProgramEntity.fromModel(loyaltyProgram));
      },
      (failure) {
        return Failure(failure);
      },
    );
  }
}
