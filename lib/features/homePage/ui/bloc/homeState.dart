part of 'homeBloc.dart';

enum HomeStatus { initial, loading, error, success }
enum ProgramStatus { initial, loading, error, success }

class HomeState extends Equatable {
  final HomeStatus? homeStatus;
  final ProgramStatus? programStatus;
  final String? message;
  final List<LoyaltyProgramEntity>? listOfPrograms;

  const HomeState({
    this.homeStatus = HomeStatus.initial,
    this.programStatus = ProgramStatus.initial,
    this.message,
    this.listOfPrograms = const [],
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    ProgramStatus? programStatus,
    String? message,
    List<LoyaltyProgramEntity>? listOfPrograms,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      programStatus: programStatus ?? this.programStatus,
      message: message ?? this.message,
      listOfPrograms: listOfPrograms ?? this.listOfPrograms,
    );
  }

  @override
  List<Object?> get props => [homeStatus, programStatus, message, listOfPrograms];
}
