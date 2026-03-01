import 'package:result_dart/result_dart.dart';

import '../../services/helpers/program_type_enum.dart';
import '../entities/loyalty_program_entity.dart';
import '../entities/spend_entity.dart';
import '../entities/reward_entity.dart';
import '../entities/return_entity.dart';

abstract class LoyaltyProgramRepository {

  Future<Result<LoyaltyProgramEntity>> createProgram(LoyaltyProgramEntity programEntity);

  Future<Result<ReturnEntity>> createReturnProgram({required ReturnEntity returnEntity});

  Future<Result<Map<ProgramType, List<LoyaltyProgramEntity>>>> getLoyaltyProgram();

  Map<ProgramType, List<LoyaltyProgramEntity>> get existingPrograms;
}
