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
