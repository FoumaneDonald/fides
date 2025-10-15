import 'package:result_dart/result_dart.dart';

import '../../domain/entities/loyalty_program_entity.dart';
import '../../domain/entities/spendEntity/spend_entity.dart';
import '../../domain/entities/reward_entity.dart';
import '../../domain/entities/returnEntity/return_entity.dart';
import '../../domain/repositories/loyalty_program_repository.dart';
import '../../services/helpers/program_type_enum.dart';
import '../models/spend_model.dart';
import '../models/reward_model.dart';
import '../../services/loyalty_program_dao.dart';
import '../models/return_model.dart';

class LocalLoyaltyProgramRepoImpl implements LoyaltyProgramRepository {
  final LoyaltyProgramDao _loyaltyProgramDao;

  LocalLoyaltyProgramRepoImpl(LoyaltyProgramDao loyaltyProgramDao) : _loyaltyProgramDao = loyaltyProgramDao;

  final Map<ProgramType, List<LoyaltyProgramEntity>> _existingPrograms = {};

  @override
  Map<ProgramType, List<LoyaltyProgramEntity>> get existingPrograms => _existingPrograms;

  @override
  Future<Result<SpendEntity>> createSpendProgram({required SpendEntity spendEntity}) async {
    try {
      final pointsModel = SpendModel.fromEntity(spendEntity);

      final result = _loyaltyProgramDao.createPointsProgram(pointsModel);

      return result.fold(
        (program) => Success(SpendEntity.fromModel(program)),
        (failure) => Failure(failure),
      );
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result<ReturnEntity>> createReturnProgram({required ReturnEntity returnEntity}) async {
    try {
      final ReturnModel returnModel = ReturnModel.fromEntity(returnEntity);

      final result = _loyaltyProgramDao.createReturnProgram(returnModel);

      return result.fold(
        (program) => Success(ReturnEntity.fromModel(program)),
        (failure) => Failure(failure),
      );
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result<Map<ProgramType, List<LoyaltyProgramEntity>>>> getLoyaltyProgram() async {
    try {
      final ResultDart<Map<ProgramType, List<Object>>, Exception> result = _loyaltyProgramDao.getAllLoyaltyProgram();
      return result.fold(
        (programModels) {
          final Map<ProgramType, List<LoyaltyProgramEntity>> conversion = Map.fromEntries(
            programModels.entries.map(
              (entry) => MapEntry(
                entry.key,
                entry.value.map((model) {
                  if (model is ReturnModel) {
                    return ReturnEntity.fromModel(model);
                  } else if (model is SpendModel) {
                    return SpendEntity.fromModel(model);
                  } else {
                    throw Exception('Unknown model type: ${model.runtimeType}');
                  }
                }).toList(),
              ),
            ),
          );
          return Success(conversion);
        },
        (failure) {
          return Failure(failure);
        },
      );
    } on Exception catch (error, stackTrace) {
      return Failure(error);
    }
  }
}
