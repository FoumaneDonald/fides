import 'package:result_dart/result_dart.dart';

import '../../services/helpers/program_type_enum.dart';
import '../entities/loyalty_program_entity.dart';
import '../entities/spendEntity/spend_entity.dart';
import '../entities/reward_entity.dart';
import '../entities/returnEntity/return_entity.dart';

abstract class LoyaltyProgramRepository {

  Future<Result<SpendEntity>> createSpendProgram({required SpendEntity spendEntity});

  Future<Result<ReturnEntity>> createReturnProgram({required ReturnEntity returnEntity});

  Future<Result<Map<ProgramType, List<LoyaltyProgramEntity>>>> getLoyaltyProgram();

  Map<ProgramType, List<LoyaltyProgramEntity>> get existingPrograms;
}
