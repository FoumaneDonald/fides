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

  final Map<ProgramType, List<LoyaltyProgramEntity>> _existingPrograms = {};

  @override
  Map<ProgramType, List<LoyaltyProgramEntity>> get existingPrograms => _existingPrograms;

  @override
  Future<Result<PointsEntity>> createPointsProgram({required PointsEntity pointsEntity}) async {
    final pointsModel = PointsModel.fromEntity(pointsEntity);

    final result = _loyaltyProgramDao.createPointsProgram(pointsModel);

    return result.fold(
      (program) => Success(PointsEntity.fromModel(program)),
      (failure) => Failure(failure),
    );
  }

  @override
  Future<Result<StampEntity>> createStampProgram({required StampEntity stampEntity}) async {
    final StampModel stampModel = StampModel.fromEntity(stampEntity);

    final result = _loyaltyProgramDao.createStampProgram(stampModel);

    return result.fold(
      (program) => Success(StampEntity.fromModel(program)),
      (failure) => Failure(failure),
    );
  }

  @override
  Future<Result<Map<ProgramType, List<LoyaltyProgramEntity>>>> getLoyaltyProgram() async {
    final ResultDart<Map<ProgramType, List<Object>>, Exception> result = _loyaltyProgramDao.getAllLoyaltyProgram();
    return result.fold(
      (programModels) {
        // _existingPrograms.clear();
        //
        // programModels.forEach(
        //   (programType, models) {
        //     switch (programType) {
        //       case ProgramType.stamp:
        //         _existingPrograms[programType] = models.whereType<StampModel>().map((model) => StampEntity.fromModel(model)).toList();
        //         break;
        //       case ProgramType.points:
        //         _existingPrograms[programType] = models.whereType<PointsModel>().map((model) => PointsEntity.fromModel(model)).toList();
        //         break;
        //       case ProgramType.unknown:
        //         _existingPrograms;
        //         break;
        //     }
        //   },
        // );
        final Map<ProgramType, List<LoyaltyProgramEntity>> conversion = Map.fromEntries(
          programModels.entries.map(
            (entry) => MapEntry(
              entry.key,
              entry.value.map((model) {
                if (model is StampModel) {
                  return StampEntity.fromModel(model);
                } else if (model is PointsModel) {
                  return PointsEntity.fromModel(model);
                } else {
                  throw UnsupportedError('Unknown model type: ${model.runtimeType}');
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
  }
}
