import 'package:result_dart/result_dart.dart';

import '../../domain/entities/loyalty_program_entity.dart';
import '../../domain/entities/points_entity.dart';
import '../../domain/entities/reward_entity.dart';
import '../../domain/entities/stamp_entity.dart';
import '../../domain/repositories/loyalty_program_repository.dart';
import '../../services/helpers/program_type_enum.dart';
import '../models/loyalty_program_model.dart';
import '../models/points_model.dart';
import '../models/reward_model.dart';
import '../../services/loyalty_program_dao.dart';
import '../models/stamp_model.dart';

class LocalLoyaltyProgramRepoImpl implements LoyaltyProgramRepository {
  final LoyaltyProgramDao _loyaltyProgramDao;

  LocalLoyaltyProgramRepoImpl(LoyaltyProgramDao loyaltyProgramDao) : _loyaltyProgramDao = loyaltyProgramDao;

  final Map<ProgramType, List<Object>> _existingPrograms = {};

  @override
  Map<ProgramType, List<Object>> get existingPrograms => _existingPrograms;

  @override
  Future<Result<PointsEntity>> createPointsProgram({required PointsEntity pointsEntity, required List<RewardEntity> rewardList}) async {
    final List<RewardModel> rewardsToModel = rewardList.map(RewardModel.fromEntity).toList();

    final pointsModel = PointsModel.fromEntity(pointsEntity);

    final result = _loyaltyProgramDao.createPointsProgram(pointsModel, rewardsToModel);

    return result.fold(
      (program) => Success(PointsEntity.fromModel(program)),
      (failure) => Failure(failure),
    );
  }

  @override
  Future<Result<StampEntity>> createStampProgram({required StampEntity stampEntity, required List<RewardEntity> rewardList}) async {
    final List<RewardModel> rewardsToModel = rewardList.map(RewardModel.fromEntity).toList();

    final stampModel = StampModel.fromEntity(stampEntity);

    final result = _loyaltyProgramDao.createStampProgram(stampModel, rewardsToModel);

    return result.fold(
      (program) => Success(StampEntity.fromModel(program)),
      (failure) => Failure(failure),
    );
  }

  @override
  Future<Result<Map<ProgramType, List<Object>>>> getLoyaltyProgram() async {
    final ResultDart<Map<ProgramType, List<Object>>, Exception> result = _loyaltyProgramDao.getAllLoyaltyProgram();
    return result.fold(
      (programModels) {
        _existingPrograms.clear();

        programModels.forEach((programType, models) {
          switch (programType) {
            case ProgramType.stamp:
              _existingPrograms[programType] = models
                  .whereType<StampModel>()
                  .map((model) => StampEntity.fromModel(model))
                  .toList();
              break;
            case ProgramType.points:
              _existingPrograms[programType] = models
                  .whereType<PointsModel>()
                  .map((model) => PointsEntity.fromModel(model))
                  .toList();
              break;
            case ProgramType.unknown:
              _existingPrograms;
              break;
          }
        });
        return Success(_existingPrograms);
      },
      (failure) {
        return Failure(failure);
      },
    );
  }
}
