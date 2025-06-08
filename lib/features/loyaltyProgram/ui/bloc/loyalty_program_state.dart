part of 'loyalty_program_bloc.dart';

enum Status { initial, loading, error, success, ongoing, loaded }

enum RewardStatus { initial, loading, error, added }

@freezed
abstract class LoyaltyProgramState with _$LoyaltyProgramState {
  const LoyaltyProgramState._();

  const factory LoyaltyProgramState({
    Status? status,
    RewardStatus? rewardStatus,
    String? message,
    ProgramType? selectedProgramType,
    ProgramType? selectedFilterProgram,
    bool? allFilter,
    LoyaltyProgramEntity? loyaltyProgramEntity,
    Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
    List<LoyaltyProgramEntity>? listOfSelectedProgram,
    int? stampReward,
  }) = _LoyaltyProgramState;

  factory LoyaltyProgramState.initial() => const LoyaltyProgramState(
    status: Status.initial,
    rewardStatus: RewardStatus.initial,
    message: '',
    selectedProgramType: null,
    selectedFilterProgram: null,
    allFilter: true,
    loyaltyProgramEntity: null,
    listOfPrograms: {},
    listOfSelectedProgram: [],
    stampReward: null,
  );

}
