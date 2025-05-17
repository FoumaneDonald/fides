part of 'loyalty_program_bloc.dart';

enum Status { initial, loading, error, success, ongoing, loaded }

enum RewardStatus { initial, loading, error, added }

class LoyaltyProgramState extends Equatable {
  final Status? status;
  final RewardStatus? rewardStatus;
  final String? message;
  final ProgramType? selectedProgramType;
  final ProgramType? selectedFilterProgram;
  final bool? allFilter;
  final LoyaltyProgramEntity? loyaltyProgramEntity;

  // final PointsEntity? pointsEntity;
  // final StampEntity? stampEntity;
  final Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms;
  final List<LoyaltyProgramEntity>? listOfSelectedProgram;
  final List<RewardEntity>? rewardEntityList;

  const LoyaltyProgramState._({
    this.status,
    this.rewardStatus,
    this.message,
    this.selectedProgramType,
    this.selectedFilterProgram,
    this.allFilter,
    this.loyaltyProgramEntity,
    // this.pointsEntity,
    // this.stampEntity,
    this.listOfPrograms,
    this.listOfSelectedProgram,
    this.rewardEntityList,
  });

  LoyaltyProgramState.initial()
      : this._(
          status: Status.initial,
          rewardStatus: RewardStatus.initial,
          message: '',
          selectedProgramType: null,
          selectedFilterProgram: null,
          allFilter: true,
          loyaltyProgramEntity: null,
          // pointsEntity: PointsEntity(currencyCode: 'XAF'),
          // stampEntity: StampEntity(numberHoles: 4, winningNumbers: [3]),
          listOfPrograms: {},
          listOfSelectedProgram: [],
          rewardEntityList: [],
        );

  LoyaltyProgramState copyWith({
    Status? status,
    RewardStatus? rewardStatus,
    String? message,
    ProgramType? selectedProgramType,
    ProgramType? selectedFilterProgram,
    bool? allFilter,
    LoyaltyProgramEntity? loyaltyProgramEntity,
    // PointsEntity? pointsEntity,
    // StampEntity? stampEntity,
    Map<ProgramType, List<LoyaltyProgramEntity>>? listOfPrograms,
    List<LoyaltyProgramEntity>? listOfSelectedProgram,
    List<RewardEntity>? rewardEntityList,
  }) {
    return LoyaltyProgramState._(
        status: status ?? this.status,
        rewardStatus: rewardStatus ?? this.rewardStatus,
        message: message ?? this.message,
        selectedProgramType: selectedProgramType ?? this.selectedProgramType,
        selectedFilterProgram: selectedFilterProgram ?? this.selectedFilterProgram,
        allFilter: allFilter ?? this.allFilter,
        loyaltyProgramEntity: loyaltyProgramEntity ?? this.loyaltyProgramEntity,
        // pointsEntity: pointsEntity ?? this.pointsEntity,
        // stampEntity: stampEntity ?? this.stampEntity,
        listOfPrograms: listOfPrograms ?? this.listOfPrograms,
        listOfSelectedProgram: listOfSelectedProgram ?? this.listOfSelectedProgram,
        rewardEntityList: rewardEntityList ?? this.rewardEntityList);
  }

  @override
  List<Object?> get props => [
        status,
        rewardStatus,
        message,
        selectedProgramType,
        selectedFilterProgram,
        allFilter,
        loyaltyProgramEntity,
        // pointsEntity,
        // stampEntity,
        listOfPrograms,
        listOfSelectedProgram,
        rewardEntityList,
      ];
}
