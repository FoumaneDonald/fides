import 'package:fides/data/entities/rewardEntity.dart';
import 'package:fides/domain/models/loyaltyProgramModel.dart';
import 'package:fides/domain/models/rewardModel.dart';
import 'package:result_dart/result_dart.dart';

import '../../data/entities/loyaltyProgramEntity.dart';
import '../../data/repositories/LoyaltyProgramRepository.dart';
import '../../services/loyaltyProgramDao.dart';

class LocalLoyaltyProgramRepoImpl implements LoyaltyProgramRepository {
  final LoyaltyProgramDao loyaltyProgramDao;

  LocalLoyaltyProgramRepoImpl(this.loyaltyProgramDao);

  @override
  Future<Result<LoyaltyProgramEntity>> createLoyaltyProgram({required LoyaltyProgramEntity loyaltyProgramEntity, required RewardEntity reward}) async {
    final result = loyaltyProgramDao.create(
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

  @override
  Future<Result<List<LoyaltyProgramEntity>>> getLoyaltyProgram() async{
    final result = loyaltyProgramDao.getAllLoyaltyProgram();
    return result.fold(
        (programs) {
          List<LoyaltyProgramEntity> programsModelToEntity = programs.map((program) => LoyaltyProgramEntity.fromModel(program)).toList();
          return Success(programsModelToEntity);
        },
        (failure) {
          return Failure(failure);
        }
    );
  }
}
