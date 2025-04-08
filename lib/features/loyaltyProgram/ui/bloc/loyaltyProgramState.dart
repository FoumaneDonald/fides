part of 'loyaltyProgramBloc.dart';

enum Status { initial, loading, error, success, ongoing }

class LoyaltyProgramState extends Equatable {
  final Status? status;
  final String? message;
  final LoyaltyProgramEntity? loyaltyProgramEntity;

  // final List<LoyaltyProgramEntity>? listOfPrograms;
  final RewardEntity? rewardEntity;

  const LoyaltyProgramState({
    this.status,
    this.message,
    this.loyaltyProgramEntity,
    // this.listOfPrograms,
    this.rewardEntity,
  });

  factory LoyaltyProgramState.initial() => LoyaltyProgramState(
        status: Status.initial,
        message: '',
        loyaltyProgramEntity: LoyaltyProgramEntity().copyWith(numberHoles: Value(4), winningNumbers: Value([3])),
        // listOfPrograms: const [],
        rewardEntity: RewardEntity().copyWith(type: 'Free', discountType: Value('FCFA')),
      );

  LoyaltyProgramState copyWith({
    Status? status,
    String? message,
    LoyaltyProgramEntity? loyaltyProgramEntity,
    // List<LoyaltyProgramEntity>? listOfPrograms,
    RewardEntity? rewardEntity,
  }) {
    return LoyaltyProgramState(
      status: status ?? this.status,
      message: message ?? this.message,
      loyaltyProgramEntity: loyaltyProgramEntity ?? this.loyaltyProgramEntity,
      // listOfPrograms: listOfPrograms ?? this.listOfPrograms,
      rewardEntity: rewardEntity ?? this.rewardEntity,
    );
  }

  @override
  List<Object?> get props => [status, message, loyaltyProgramEntity, rewardEntity];
}
