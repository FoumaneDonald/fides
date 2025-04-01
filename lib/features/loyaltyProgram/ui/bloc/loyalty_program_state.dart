part of 'loyalty_program_bloc.dart';

enum Status { initial, loading, error, done, ongoing }

class LoyaltyProgramState extends Equatable {
  final Status? status;
  final LoyaltyProgramEntity? loyaltyProgramEntity;
  final RewardEntity? rewardEntity;
  final String? message;

  const LoyaltyProgramState({
    this.status,
    this.loyaltyProgramEntity,
    this.rewardEntity,
    this.message,
  });

  factory LoyaltyProgramState.initial() => LoyaltyProgramState(
    status: Status.initial,
    loyaltyProgramEntity: LoyaltyProgramEntity().copyWith(numberHoles: 4, winningNumbers: [3]),
    rewardEntity: RewardEntity().copyWith(type: 'Free', discountType: Value('FCFA')),
    message: ''
  );

  LoyaltyProgramState copyWith({
    Status? status,
    LoyaltyProgramEntity? loyaltyProgramEntity,
    RewardEntity? rewardEntity,
    String? message,
  }) {
    return LoyaltyProgramState(
      status: status ?? this.status,
      loyaltyProgramEntity: loyaltyProgramEntity ?? this.loyaltyProgramEntity,
      rewardEntity: rewardEntity ?? this.rewardEntity,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, loyaltyProgramEntity, rewardEntity, message];
}
