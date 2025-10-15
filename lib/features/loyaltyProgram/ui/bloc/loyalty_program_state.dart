part of 'loyalty_program_bloc.dart';

@MappableClass()
sealed class LoyaltyProgramState with LoyaltyProgramStateMappable {
  const LoyaltyProgramState();
}

/// Initial state
@MappableClass()
class LoyaltyProgramInitial extends LoyaltyProgramState with LoyaltyProgramInitialMappable {
  const LoyaltyProgramInitial();
}

/// Loading data (programs, rewards, submission, etc.)
@MappableClass()
class LoyaltyProgramLoading extends LoyaltyProgramState with LoyaltyProgramLoadingMappable {
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

enum Status { idle, loading, error, success }
enum RewardStatus { initial, loading, error, added }

/// A program is actively being edited
@MappableClass()
class LoyaltyProgramEditing extends LoyaltyProgramState with LoyaltyProgramEditingMappable {
  final ProgramType programType;
  final LoyaltyProgramEntity program;
  final int? selectReturnNumber;
  final bool loading;
  final Status status;
  final RewardStatus rewardStatus;
  final String? message;

  const LoyaltyProgramEditing({
    required this.programType,
    required this.program,
    this.selectReturnNumber,
    this.loading = false,
    this.status = Status.idle,
    this.rewardStatus = RewardStatus.initial,
    this.message,
  });
}

/// Reward-specific state
@MappableClass()
class RewardAdded extends LoyaltyProgramState with RewardAddedMappable {
  final LoyaltyProgramEntity updatedProgram;
  const RewardAdded(this.updatedProgram);
}

/// Error state
@MappableClass()
class LoyaltyProgramError extends LoyaltyProgramState with LoyaltyProgramErrorMappable {
  final String message;
  const LoyaltyProgramError(this.message);
}