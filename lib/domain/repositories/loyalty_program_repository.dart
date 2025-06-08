import 'package:result_dart/result_dart.dart';

import '../../services/helpers/program_type_enum.dart';
import '../entities/loyalty_program_entity.dart';
import '../entities/points_entity.dart';
import '../entities/reward_entity.dart';
import '../entities/stamp_entity.dart';

abstract class LoyaltyProgramRepository {

  Future<Result<PointsEntity>> createPointsProgram({required PointsEntity pointsEntity});

  Future<Result<StampEntity>> createStampProgram({required StampEntity stampEntity});

  Future<Result<Map<ProgramType, List<LoyaltyProgramEntity>>>> getLoyaltyProgram();

  Map<ProgramType, List<LoyaltyProgramEntity>> get existingPrograms;
}
