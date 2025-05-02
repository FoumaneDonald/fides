import 'package:result_dart/result_dart.dart';

import '../../domain/entities/loyalty_program_entity.dart';
import '../../domain/entities/reward_entity.dart';
import '../../domain/repositories/loyalty_program_repository.dart';
import '../models/loyalty_program_model.dart';
import '../models/reward_model.dart';
import '../../services/loyalty_program_dao.dart';

class LocalLoyaltyProgramRepoImpl implements LoyaltyProgramRepository {
  final LoyaltyProgramDao loyaltyProgramDao;

  LocalLoyaltyProgramRepoImpl(this.loyaltyProgramDao);

  final List<LoyaltyProgramEntity> _existingPrograms = [];

  @override
  List<LoyaltyProgramEntity> get existingPrograms => _existingPrograms;

  @override
  Future<Result<LoyaltyProgramEntity>> createLoyaltyProgram({required LoyaltyProgramEntity loyaltyProgramEntity, required List<RewardEntity> rewardList}) async {
    final List<RewardModel> rewardsToModel = rewardList.map((reward) => RewardModel.fromEntity(reward)).toList();
    final result = loyaltyProgramDao.create(
      LoyaltyProgramModel.fromEntity(loyaltyProgramEntity),
      rewardsToModel,
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

  @override
  Future<Result<List<LoyaltyProgramEntity>>> getLoyaltyProgram() async {
    final result = loyaltyProgramDao.getAllLoyaltyProgram();
    return result.fold((programModels) {
      List<LoyaltyProgramEntity> programEntities = programModels.map((model) => LoyaltyProgramEntity.fromModel(model)).toList();
      _existingPrograms.addAll(programEntities);
      return Success(programEntities);
    }, (failure) {
      return Failure(failure);
    });
  }
}
