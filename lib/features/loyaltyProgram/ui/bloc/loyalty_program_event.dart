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
  final double pointValue;

  const PointValueChanged(
    this.pointValue,
  );
}

final class MinimumPurchaseChanged extends LoyaltyProgramEvent {
  final double minimumPurchase;

  const MinimumPurchaseChanged(this.minimumPurchase,);

  @override
  List<Object?> get props => [minimumPurchase];
}

final class CurrencyChanged extends LoyaltyProgramEvent {
  final String currency;

  const CurrencyChanged(this.currency,);

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

final class ResetForms extends LoyaltyProgramEvent {}

final class DeleteReward extends LoyaltyProgramEvent {
  final RewardEntity reward;

  const DeleteReward(this.reward);

  @override
  List<Object?> get props => [reward];
}