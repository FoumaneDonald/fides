part of 'setup_program_bloc.dart';

sealed class SetupProgramEvent extends Equatable {
  const SetupProgramEvent();

  @override
  List<Object?> get props => [];
}

final class SelectedLoyaltyProgram extends SetupProgramEvent {
  final ProgramType programType;

  const SelectedLoyaltyProgram(this.programType);

  @override
  List<Object?> get props => [programType];
}

final class WinningStampChanged extends SetupProgramEvent {
  final int winningNumber;

  const WinningStampChanged(
    this.winningNumber,
  );

  @override
  List<Object?> get props => [winningNumber];
}

final class TotalReturnsChanged extends SetupProgramEvent {
  final int returns;

  const TotalReturnsChanged(this.returns);

  @override
  List<Object?> get props => [returns];
}

final class SelectedReturnRewardChanged extends SetupProgramEvent {
  final int selectReturnNumber;

  const SelectedReturnRewardChanged(this.selectReturnNumber);

  @override
  List<Object?> get props => [selectReturnNumber];
}

final class NameChanged extends SetupProgramEvent {
  final String name;

  const NameChanged(
    this.name,
  );

  @override
  List<Object?> get props => [name];
}

final class ValidityPeriodChanged extends SetupProgramEvent {
  final int value;

  const ValidityPeriodChanged(this.value,);

  @override
  List<Object?> get props => [value];
}

final class PointsChanged extends SetupProgramEvent {
  final double pointValue;

  const PointsChanged(this.pointValue);

  @override
  List<Object?> get props => [pointValue];
}

final class MinimumSpentChanged extends SetupProgramEvent {
  final double minimumSpent;

  const MinimumSpentChanged(this.minimumSpent);

  @override
  List<Object?> get props => [minimumSpent];
}

final class CurrencyChanged extends SetupProgramEvent {
  final String currency;

  const CurrencyChanged(this.currency);

  @override
  List<Object?> get props => [currency];
}

final class SubmitLoyaltyProgram extends SetupProgramEvent {}

final class AddReward extends SetupProgramEvent {
  final RewardType type;
  final int unlockThreshold;
  final int? discountValue;
  final DiscountType? discountType;
  final String item;
  final String imagePath;
  final String description;
  final int? minimumPurchase;

  const AddReward({
    required this.type,
    required this.unlockThreshold,
    this.discountValue,
    this.discountType,
    required this.item,
    required this.imagePath,
    required this.description,
    this.minimumPurchase,
  });

  @override
  List<Object?> get props => [type, unlockThreshold, discountValue, discountType, item, imagePath, description, minimumPurchase];
}

final class DeleteReward extends SetupProgramEvent {
  final RewardEntity reward;

  const DeleteReward(this.reward);

  @override
  List<Object?> get props => [reward];
}
