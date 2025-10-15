import 'package:result_dart/result_dart.dart';

import '../data/models/spend_model.dart';
import '../data/models/return_model.dart';
import '../objectbox.g.dart';
import 'helpers/program_type_enum.dart';
import 'object_box.dart';

class LoyaltyProgramDao {
  // Inject the ObjectBox
  final ObjectBox _objectBox;

  LoyaltyProgramDao(this._objectBox);

  Box<SpendModel> get _spendProgramBox => _objectBox.store.box<SpendModel>();

  Box<ReturnModel> get _returnProgramBox => _objectBox.store.box<ReturnModel>();

  ///TODO: C(done)RUD

  /// Creates a new Reward with a unique ID.
  // Result<LoyaltyProgramModel> create(LoyaltyProgramModel loyaltyProgramModel, List<RewardModel> rewardModelList) {
  //   try {
  //     String loyaltyProgramId = const Uuid().v4();
  //
  //     // add a unique id to reward and program
  //     final loyaltyProgram = loyaltyProgramModel.copyWith(uid: loyaltyProgramId);
  //     final List<RewardModel> rewards = rewardModelList.map((reward) => reward.copyWith(uid: Uuid().v4())).toList();
  //
  //     // add related reward of the program in order to create relation in the database
  //     loyaltyProgram.rewards.addAll(rewards);
  //
  //     _loyaltyProgramBox.put(loyaltyProgram);
  //     return Success(loyaltyProgram);
  //   } catch (error, stackTrace) {
  //     print('$error, $stackTrace');
  //     return Failure(Exception('Failed to create data'));
  //   }
  // }

  /// Creates a new loyalty program (e.g., Points or Stamp) with associated rewards.
  ///
  /// This generic function handles the common logic for initializing a program model,
  /// generating unique IDs for both the program and its rewards, associating the rewards
  /// with the program, and saving the program to its corresponding storage box.
  ///
  /// Type Parameters:
  /// - [T]: The type of the program model (e.g., PointsModel or StampModel).
  ///
  /// Parameters:
  /// - [programModel]: The initial instance of the program to be created.
  /// - [programRewards]: A list of rewards to be associated with the program.
  /// - [copyProgramWithUid]: A function that takes a generated UID and returns a
  ///   copy of the program model with the UID set.
  /// - [putToBox]: A function to persist the program to its storage (e.g., objectbox).
  /// - [attachRewards]: A function that associates the list of rewards with the program.
  ///
  /// Returns:
  /// - A [Result<T>] that is either a [Success] with the completed program or
  ///   a [Failure] if an error occurred.
  Result<T> createProgram<T extends Object>({
    required T programModel,
    required void Function(T program) putToBox,
  }) {
    try {
      // Save the program to the appropriate storage.
      putToBox(programModel);

      // Return a successful result with the fully built program.
      return Success(programModel);
    } catch (error, stackTrace) {
      // Log the error for debugging purposes and return a failure.
      print('$error, $stackTrace');
      return Failure(Exception('Failed to create data'));
    }
  }

  /// Creates a new points program.
  Result<SpendModel> createPointsProgram(SpendModel model) {
    return createProgram<SpendModel>(
      programModel: model,
      putToBox: (program) => _spendProgramBox.put(program),
    );
  }

  /// Creates a new return program
  Result<ReturnModel> createReturnProgram(ReturnModel model) {
    return createProgram<ReturnModel>(
      programModel: model,
      putToBox: (program) => _returnProgramBox.put(program),
    );
  }

  Result<Map<ProgramType, List<Object>>> getAllLoyaltyProgram() {
    try {
      QueryBuilder<ReturnModel> stampBuilder = _returnProgramBox.query();
      stampBuilder.backlink(RewardModel_.returnProgram);

      QueryBuilder<SpendModel> pointsBuilder = _spendProgramBox.query();
      pointsBuilder.backlink(RewardModel_.spendProgram);

      Query<ReturnModel> queryStamp = stampBuilder.build();
      Query<SpendModel> queryPoints = pointsBuilder.build();

      List<ReturnModel> returnPrograms = queryStamp.find();
      List<SpendModel> spendPrograms = queryPoints.find();

      return Success({
        ProgramType.returning: returnPrograms,
        ProgramType.spend: spendPrograms,
      });
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure(Exception('Could not retrieve data'));
    }
  }
}
