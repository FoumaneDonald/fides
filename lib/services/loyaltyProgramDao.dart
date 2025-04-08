import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../domain/models/loyaltyProgramModel.dart';
import '../domain/models/rewardModel.dart';
import '../objectbox.g.dart';
import 'objectBox.dart';

class LoyaltyProgramDao {
  // Inject the ObjectBox
  final ObjectBox _objectBox;

  LoyaltyProgramDao(this._objectBox);

  Box<LoyaltyProgramModel> get _loyaltyProgramBox => _objectBox.store.box<LoyaltyProgramModel>();

  ///TODO: C(done)RUD

  /// Creates a new Reward with a unique ID.
  Result<LoyaltyProgramModel> create(LoyaltyProgramModel loyaltyProgramModel, RewardModel rewardModel) {
    try {
      String rewardId = const Uuid().v4();
      String loyaltyProgramId = const Uuid().v4();

      // add a unique id to reward and program
      final loyaltyProgram = loyaltyProgramModel.copyWith(uid: loyaltyProgramId);
      final reward = rewardModel.copyWith(uid: rewardId);

      // add related reward of the program in order to create relation in the database
      loyaltyProgram.rewards.add(reward);

      _loyaltyProgramBox.put(loyaltyProgram);
      return Success(loyaltyProgram);
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure(Exception('Failed to create data'));
    }
  }

  Result<List<LoyaltyProgramModel>> getAllLoyaltyProgram() {
    try {
      QueryBuilder<LoyaltyProgramModel> builder = _loyaltyProgramBox.query();
      builder.backlink(RewardModel_.loyaltyProgram);
      Query<LoyaltyProgramModel> query = builder.build();
      List<LoyaltyProgramModel> loyaltyPrograms = query.find();
      return Success(loyaltyPrograms);
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure(Exception('Could not retrieve data'));}
  }
}
