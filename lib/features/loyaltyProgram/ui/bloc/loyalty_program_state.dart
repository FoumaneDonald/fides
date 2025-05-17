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
  final PointsEntity? pointsEntity;
  final StampEntity? stampEntity;
  final Map<ProgramType, List<Object>>? listOfPrograms;
  final List<Object>? listOfSelectedProgram;
  final List<RewardEntity>? rewardEntityList;

  const LoyaltyProgramState._({
    this.status,
    this.rewardStatus,
    this.message,
    this.selectedProgramType,
    this.selectedFilterProgram,
    this.allFilter,
    this.pointsEntity,
    this.stampEntity,
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
          pointsEntity: PointsEntity(currencyCode: 'XAF'),
          stampEntity: StampEntity(numberHoles: 4, winningNumbers: [3]),
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
    PointsEntity? pointsEntity,
    StampEntity? stampEntity,
    Map<ProgramType, List<Object>>? listOfPrograms,
    List<Object>? listOfSelectedProgram,
    List<RewardEntity>? rewardEntityList,
  }) {
    return LoyaltyProgramState._(
        status: status ?? this.status,
        rewardStatus: rewardStatus ?? this.rewardStatus,
        message: message ?? this.message,
        selectedProgramType: selectedProgramType ?? this.selectedProgramType,
        selectedFilterProgram: selectedFilterProgram ?? this.selectedFilterProgram,
        allFilter: allFilter ?? this.allFilter,
        pointsEntity: pointsEntity ?? this.pointsEntity,
        stampEntity: stampEntity ?? this.stampEntity,
        listOfPrograms: listOfPrograms ?? this.listOfPrograms,
        listOfSelectedProgram: listOfSelectedProgram ?? this.listOfSelectedProgram,
        rewardEntityList: rewardEntityList ?? this.rewardEntityList);
  }

  @override
  List<Object?> get props => [status, rewardStatus, message, selectedProgramType, selectedFilterProgram, allFilter, pointsEntity, stampEntity, listOfPrograms, listOfSelectedProgram, rewardEntityList];
}
