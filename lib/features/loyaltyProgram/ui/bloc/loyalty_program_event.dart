part of 'loyalty_program_bloc.dart';

sealed class LoyaltyProgramEvent extends Equatable {
  const LoyaltyProgramEvent();

  @override
  List<Object?> get props => [];
}

final class SelectedLoyaltyProgram extends LoyaltyProgramEvent {
  final String programName;

  const SelectedLoyaltyProgram(this.programName);

  @override
  List<Object?> get props => [programName];
}

final class AboutStampProgramChanged extends LoyaltyProgramEvent {
  final String? name;
  final int? numHoles;
  final int? winningNumbers;
  final int? deletedNumber;
  final String? test;

  const AboutStampProgramChanged({this.name, this.numHoles, this.winningNumbers, this.deletedNumber, this.test});

  @override
  List<Object?> get props => [name, numHoles, winningNumbers, deletedNumber];
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
