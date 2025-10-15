part of 'loyalty_program_bloc.dart';

sealed class LoyaltyProgramEvent extends Equatable {
  const LoyaltyProgramEvent();

  @override
  List<Object?> get props => [];
}

final class LoadLoyaltyPrograms extends LoyaltyProgramEvent {}

final class AllPrograms extends LoyaltyProgramEvent {}

final class FilterProgram extends LoyaltyProgramEvent {
  final ProgramType program;

  const FilterProgram(this.program);

  @override
  List<Object?> get props => [program];
}

final class SelectedLoyaltyProgram extends LoyaltyProgramEvent {
  final ProgramType programType;

  const SelectedLoyaltyProgram(this.programType);

  @override
  List<Object?> get props => [programType];
}

final class WinningStampChanged extends LoyaltyProgramEvent {
  final int winningNumber;

  const WinningStampChanged(
    this.winningNumber,
  );

  @override
  List<Object?> get props => [winningNumber];
}

final class NumHolesChanged extends LoyaltyProgramEvent {
  final int numHoles;
  final int? deletedFromHereOn;

  const NumHolesChanged({required this.numHoles, this.deletedFromHereOn});

  @override
  List<Object?> get props => [numHoles, deletedFromHereOn];
}

final class SelectedReturnRewardChanged extends LoyaltyProgramEvent {
  final int selectReturnNumber;

  const SelectedReturnRewardChanged(this.selectReturnNumber);

  @override
  List<Object?> get props => [selectReturnNumber];
}

final class NameChanged extends LoyaltyProgramEvent {
  final String name;

  const NameChanged(
    this.name,
  );

  @override
  List<Object?> get props => [name];
}

final class LastingDateChanged extends LoyaltyProgramEvent {
  final int lastingNumber;
  final TimeUnit lastingPeriod;

  const LastingDateChanged({
    required this.lastingNumber,
    required this.lastingPeriod,
  });

  @override
  List<Object?> get props => [lastingNumber, lastingPeriod];
}

final class PointsChanged extends LoyaltyProgramEvent {
  final double pointValue;

  const PointsChanged(
    this.pointValue,
  );
}

final class MinimumSpentChanged extends LoyaltyProgramEvent {
  final double minimumSpent;

  const MinimumSpentChanged(
    this.minimumSpent,
  );

  @override
  List<Object?> get props => [minimumSpent];
}

final class CurrencyChanged extends LoyaltyProgramEvent {
  final String currency;

  const CurrencyChanged(
    this.currency,
  );

  @override
  List<Object?> get props => [currency];
}

final class SubmitLoyaltyProgram extends LoyaltyProgramEvent {}

final class AddReward extends LoyaltyProgramEvent {
  final RewardEntity rewardEntity;

  const AddReward(
    this.rewardEntity,
  );

  @override
  List<Object?> get props => [rewardEntity];
}

final class DeleteReward extends LoyaltyProgramEvent {
  final RewardEntity reward;

  const DeleteReward(this.reward);

  @override
  List<Object?> get props => [reward];
}
