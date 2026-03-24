part of 'setup_program_bloc.dart';

enum Status { idle, loading, error, success }

enum RewardStatus { initial, loading, error, added }

sealed class SetupProgramState extends Equatable {
  const SetupProgramState();
  @override
  List<Object?> get props => [];
}

final class SetupProgramInitial extends SetupProgramState {}

final class LoyaltyProgramEditing extends SetupProgramState {
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

  LoyaltyProgramEditing copyWith({
    ProgramType? programType,
    LoyaltyProgramEntity? program,
    int? selectReturnNumber,
    bool? loading,
    Status? status,
    RewardStatus? rewardStatus,
    String? message,
  }) =>
      LoyaltyProgramEditing(
        programType: programType ?? this.programType,
        program: program ?? this.program,
        selectReturnNumber: selectReturnNumber ?? this.selectReturnNumber,
        loading: loading ?? this.loading,
        status: status ?? this.status,
        rewardStatus: rewardStatus ?? this.rewardStatus,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [programType, program, selectReturnNumber, loading, status, rewardStatus, message];
}

final class SetupProgramSubmitting extends SetupProgramState {
  final Status status;

  const SetupProgramSubmitting({
    this.status = Status.loading,
  });

  @override
  List<Object> get props => [];
}

final class SetupProgramSuccess extends SetupProgramState {}

class SetupProgramError extends SetupProgramState {
  final String message;

  const SetupProgramError(this.message);
  @override
  List<Object> get props => [message];
}
