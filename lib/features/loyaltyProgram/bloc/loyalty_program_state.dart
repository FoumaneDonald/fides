part of 'loyalty_program_bloc.dart';

sealed class LoyaltyProgramState {
  const LoyaltyProgramState();
}

class LoyaltyProgramInitial extends LoyaltyProgramState {
  const LoyaltyProgramInitial();
}

class LoyaltyProgramLoading extends LoyaltyProgramState {
  const LoyaltyProgramLoading();
}

/// Programs successfully loaded
@MappableClass()
class LoyaltyProgramLoaded extends LoyaltyProgramState with LoyaltyProgramLoadedMappable {
  final Map<ProgramType, List<LoyaltyProgramEntity>> listOfPrograms;
  final List<LoyaltyProgramEntity> selectedPrograms;
  final ProgramType? selectedFilterProgram;
  final bool allFilter;

  const LoyaltyProgramLoaded({
    required this.listOfPrograms,
    required this.selectedPrograms,
    this.selectedFilterProgram,
    this.allFilter = true,
  });
}

class LoyaltyProgramError extends LoyaltyProgramState {
  final String message;
  const LoyaltyProgramError(this.message);
}