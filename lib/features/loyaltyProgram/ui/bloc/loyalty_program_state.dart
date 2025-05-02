part of 'loyalty_program_bloc.dart';

enum Status { initial, loading, error, success, ongoing, loaded }

enum RewardStatus { initial, loading, error, added }

class LoyaltyProgramState extends Equatable {
  final Status? status;
  final RewardStatus? rewardStatus;
  final String? message;
  final LoyaltyProgramEntity? loyaltyProgramEntity;
  final List<LoyaltyProgramEntity>? listOfPrograms;
  final RewardEntity? rewardEntity;
  final List<RewardEntity>? rewardEntityList;

  const LoyaltyProgramState._({
    this.status,
    this.rewardStatus,
    this.message,
    this.loyaltyProgramEntity,
    this.listOfPrograms,
    this.rewardEntity,
    this.rewardEntityList,
  });

  LoyaltyProgramState.initial()
      : this._(
          status: Status.initial,
          rewardStatus: RewardStatus.initial,
          message: '',
          loyaltyProgramEntity: LoyaltyProgramEntity().copyWith(numberHoles: Value(4), winningNumbers: Value([3])),
          listOfPrograms: const [],
          rewardEntity: RewardEntity().copyWith(type: RewardType.free, discountType: Value(DiscountType.price)),
          rewardEntityList: const [],
        );

  LoyaltyProgramState copyWith({
    Status? status,
    RewardStatus? rewardStatus,
    String? message,
    LoyaltyProgramEntity? loyaltyProgramEntity,
    List<LoyaltyProgramEntity>? listOfPrograms,
    RewardEntity? rewardEntity,
    List<RewardEntity>? rewardEntityList,
  }) {
    return LoyaltyProgramState._(
        status: status ?? this.status,
        rewardStatus: rewardStatus ?? this.rewardStatus,
        message: message ?? this.message,
        loyaltyProgramEntity: loyaltyProgramEntity ?? this.loyaltyProgramEntity,
        listOfPrograms: listOfPrograms ?? this.listOfPrograms,
        rewardEntity: rewardEntity ?? this.rewardEntity,
        rewardEntityList: rewardEntityList ?? this.rewardEntityList);
  }

  @override
  List<Object?> get props => [status, rewardStatus, message, loyaltyProgramEntity, rewardEntity, rewardEntityList];
}
