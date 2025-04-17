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

final class RewardChanges extends LoyaltyProgramEvent {
  final String? type;
  final int? discountValue;
  final String? discountType;
  final String? item;
  final String? description;
  final int? rewardCost;
  final int? minPurchase;
  final bool submit;

  const RewardChanges({
    this.type,
    this.discountValue,
    this.discountType,
    this.item,
    this.description,
    this.rewardCost,
    this.minPurchase,
    this.submit = false,
  });

  @override
  List<Object?> get props => [type, discountValue, discountType, item, description, rewardCost, minPurchase, submit];
}

final class ResetForms extends LoyaltyProgramEvent{}
