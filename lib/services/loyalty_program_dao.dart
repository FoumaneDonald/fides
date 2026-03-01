import 'package:result_dart/result_dart.dart';

import '../config/object_box.dart';
import '../data/models/business_model.dart';
import '../data/models/loyalty_program.dart';
import '../objectbox.g.dart';

class LoyaltyProgramDao {
  final ObjectBox _objectBox;

  LoyaltyProgramDao(this._objectBox);

  Box<LoyaltyProgramModel> get _loyaltyProgramBox => _objectBox.store.box<LoyaltyProgramModel>();

  Future<Result<LoyaltyProgramModel>> createProgram(LoyaltyProgramModel programModel) async {
    try {
      // Save the program to the appropriate storage.
      LoyaltyProgramModel result = await _loyaltyProgramBox.putAndGetAsync(programModel);

      // Return a successful result with the fully built program.
      return Success(result);
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure(Exception('Failed to create data'));
    }
  }

  Result<List<LoyaltyProgramModel>> getAllLoyaltyProgram() {
    try {
      QueryBuilder<LoyaltyProgramModel> programBuilder = _loyaltyProgramBox.query();
      programBuilder.backlink(RewardModel_.program);
      programBuilder.backlinkMany(BusinessModel_.programs);

      Query<LoyaltyProgramModel> queryProgram = programBuilder.build();

      List<LoyaltyProgramModel> returnPrograms = queryProgram.find();

      return Success(returnPrograms);
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure(Exception('Could not retrieve data'));
    }
  }
}
