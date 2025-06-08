import 'dart:math';

import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../data/models/loyalty_program_model.dart';
import '../data/models/points_model.dart';
import '../data/models/reward_model.dart';
import '../data/models/stamp_model.dart';
import '../objectbox.g.dart';
import 'helpers/program_type_enum.dart';
import 'object_box.dart';

class LoyaltyProgramDao {
  // Inject the ObjectBox
  final ObjectBox _objectBox;

  LoyaltyProgramDao(this._objectBox);

  Box<PointsModel> get _pointsProgramBox => _objectBox.store.box<PointsModel>();

  Box<StampModel> get _stampProgramBox => _objectBox.store.box<StampModel>();

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
  Result<PointsModel> createPointsProgram(PointsModel model) {
    return createProgram<PointsModel>(
      programModel: model,
      putToBox: (program) => _pointsProgramBox.put(program),
    );
  }

  /// Creates a new stamp program
  Result<StampModel> createStampProgram(StampModel model) {
    return createProgram<StampModel>(
      programModel: model,
      putToBox: (program) => _stampProgramBox.put(program),
    );
  }

  Result<Map<ProgramType, List<Object>>> getAllLoyaltyProgram() {
    try {
      QueryBuilder<StampModel> stampBuilder = _stampProgramBox.query();
      stampBuilder.backlink(RewardModel_.stampProgram);

      QueryBuilder<PointsModel> pointsBuilder = _pointsProgramBox.query();
      pointsBuilder.backlink(RewardModel_.pointsProgram);

      Query<StampModel> queryStamp = stampBuilder.build();
      Query<PointsModel> queryPoints = pointsBuilder.build();

      List<StampModel> stampPrograms = queryStamp.find();
      List<PointsModel> pointsPrograms = queryPoints.find();

      return Success({
        ProgramType.stamp: stampPrograms,
        ProgramType.points: pointsPrograms,
      });
    } catch (error, stackTrace) {
      print('$error, $stackTrace');
      return Failure(Exception('Could not retrieve data'));
    }
  }
}
