part of 'loyalty_program_bloc.dart';

sealed class LoyaltyProgramEvent extends Equatable {
  const LoyaltyProgramEvent();

  @override
  List<Object?> get props => [];
}

final class LoadLoyaltyPrograms extends LoyaltyProgramEvent{}

final class SelectedLoyaltyProgram extends LoyaltyProgramEvent {
  final String programName;

  const SelectedLoyaltyProgram(this.programName);

  @override
  List<Object?> get props => [programName];
}

final class AboutStampProgramChanged extends LoyaltyProgramEvent {
  final String? name;
  final int? winningNumbers;

  const AboutStampProgramChanged({this.name, this.winningNumbers,});

  @override
  List<Object?> get props => [name, winningNumbers];
}

final class NumHolesChanged extends LoyaltyProgramEvent{
  final int numHoles;
  final int? deletedNumber;

  const NumHolesChanged({required this.numHoles, this.deletedNumber});

  @override
  List<Object?> get props => [numHoles, deletedNumber];
}

final class AboutPointProgramChanged extends LoyaltyProgramEvent {
  final String? name;
  final String? pointValue;

  const AboutPointProgramChanged({this.name, this.pointValue,});

  @override
  List<Object?> get props => [name, pointValue];
}

final class RewardTypeChanged extends LoyaltyProgramEvent {
  final RewardType type;
  const RewardTypeChanged(this.type);

  @override
  List<Object> get props => [type];
}

final class RewardDiscountValueChanged extends LoyaltyProgramEvent {
  final int? discountValue;
  const RewardDiscountValueChanged(this.discountValue);

  @override
  List<Object?> get props => [discountValue];
}

final class RewardDiscountTypeChanged extends LoyaltyProgramEvent {
  final DiscountType? discountType;
  const RewardDiscountTypeChanged(this.discountType);

  @override
  List<Object?> get props => [discountType];
}

final class RewardItemChanged extends LoyaltyProgramEvent {
  final String item;
  const RewardItemChanged(this.item);

  @override
  List<Object> get props => [item];
}

final class RewardDescriptionChanged extends LoyaltyProgramEvent {
  final String description;
  const RewardDescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}

final class RewardCostChanged extends LoyaltyProgramEvent {
  final int? rewardCost;
  const RewardCostChanged(this.rewardCost);

  @override
  List<Object?> get props => [rewardCost];
}

final class SubmitLoyaltyProgram extends LoyaltyProgramEvent {}

final class ResetForms extends LoyaltyProgramEvent{}
