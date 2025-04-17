part of 'home_bloc.dart';

enum HomeStatus { initial, loading, error, success }

class HomeState extends Equatable {
  final HomeStatus? homeStatus;
  final String? message;
  final List<LoyaltyProgramEntity>? listOfPrograms;

  const HomeState({
    this.homeStatus = HomeStatus.initial,
    this.message,
    this.listOfPrograms = const [],
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? message,
    List<LoyaltyProgramEntity>? listOfPrograms,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      message: message ?? this.message,
      listOfPrograms: listOfPrograms ?? this.listOfPrograms,
    );
  }

  @override
  List<Object?> get props => [homeStatus, message, listOfPrograms];
}
