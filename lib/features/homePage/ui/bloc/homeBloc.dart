import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/entities/loyaltyProgramEntity.dart';
import '../../../../data/repositories/LoyaltyProgramRepository.dart';

part 'homeEvent.dart';

part 'homeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;

  HomeBloc({required this.loyaltyProgramRepository}) : super(HomeState()) {
    on<InitialisingHome>(_initialisingHome);
    on<LoadLoyaltyPrograms>(_loadPrograms);
  }

  _initialisingHome(InitialisingHome event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final response = await loyaltyProgramRepository.getLoyaltyProgram();
    response.fold(
      (loyaltyPrograms) => emit(state.copyWith(homeStatus: HomeStatus.success, message: 'Program loaded', listOfPrograms: loyaltyPrograms)),
      (failure) => emit(state.copyWith(homeStatus: HomeStatus.error, message: failure.toString())),
    );
  }

_loadPrograms(LoadLoyaltyPrograms event, Emitter<HomeState> emit) async {
  emit(state.copyWith(programStatus: ProgramStatus.loading));
  final response = await loyaltyProgramRepository.getLoyaltyProgram();
  response.fold(
    (loyaltyPrograms) => emit(state.copyWith(programStatus: ProgramStatus.success, message: 'Program loaded', listOfPrograms: loyaltyPrograms)),
    (failure) => emit(state.copyWith(programStatus: ProgramStatus.error, message: failure.toString())),
  );
}
}
