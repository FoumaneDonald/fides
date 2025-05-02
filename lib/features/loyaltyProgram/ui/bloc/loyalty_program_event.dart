part of 'loyalty_program_bloc.dart';

sealed class LoyaltyProgramEvent extends Equatable {
  const LoyaltyProgramEvent();

  @override
  List<Object?> get props => [];
}

final class LoadLoyaltyPrograms extends LoyaltyProgramEvent {}

final class SelectedLoyaltyProgram extends LoyaltyProgramEvent {
  final ProgramType programType;

  const SelectedLoyaltyProgram(this.programType);

  @override
  List<Object?> get props => [programType];
}

final class WinningStampChanged extends LoyaltyProgramEvent {
  final int winningNumbers;

  const WinningStampChanged(
    this.winningNumbers,
  );

  @override
  List<Object?> get props => [winningNumbers];
}

final class NumHolesChanged extends LoyaltyProgramEvent {
  final int numHoles;
  final int? deletedNumber;

  const NumHolesChanged({required this.numHoles, this.deletedNumber});

  @override
  List<Object?> get props => [numHoles, deletedNumber];
}

final class NameChanged extends LoyaltyProgramEvent {
  final String name;

  const NameChanged(
    this.name,
  );

  @override
  List<Object?> get props => [name];
}

final class PointValueChanged extends LoyaltyProgramEvent {
  final String pointValue;

  const PointValueChanged(
    this.pointValue,
  );

  @override
  List<Object?> get props => [pointValue];
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

final class ResetForms extends LoyaltyProgramEvent {}

final class DeleteReward extends LoyaltyProgramEvent {
  final RewardEntity reward;

  const DeleteReward(this.reward);

  @override
  List<Object?> get props => [reward];
}