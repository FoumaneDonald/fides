part of 'homeBloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class InitialisingHome extends HomeEvent{}

final class LoadLoyaltyPrograms extends HomeEvent{}
