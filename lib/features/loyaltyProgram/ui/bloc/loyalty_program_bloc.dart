import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/core/enums/time_units.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/entities/return_entity.dart';
import '../../../../domain/entities/reward_entity.dart';
import '../../../../domain/entities/spend_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../services/helpers/program_type_enum.dart';

part 'loyalty_program_bloc.mapper.dart';
part 'loyalty_program_event.dart';
part 'loyalty_program_state.dart';

class LoyaltyProgramBloc extends Bloc<LoyaltyProgramEvent, LoyaltyProgramState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;

  LoyaltyProgramBloc({required this.loyaltyProgramRepository}) : super(const LoyaltyProgramInitial()) {
    on<LoadLoyaltyPrograms>(_loadPrograms);
    on<AllPrograms>(_onAllPrograms);
    on<FilterProgram>(_onFilterProgram);
  }

  Future<void> _loadPrograms(LoadLoyaltyPrograms event, Emitter<LoyaltyProgramState> emit) async {
    emit(const LoyaltyProgramLoading());
    final response = await loyaltyProgramRepository.getLoyaltyProgram();
    response.fold(
      (loyaltyPrograms) {
        // Take all programs from the map and put them into one single list.
        final List<LoyaltyProgramEntity> allPrograms = loyaltyPrograms.values.expand((list) => list).toList();
        emit(LoyaltyProgramLoaded(listOfPrograms: loyaltyPrograms, selectedPrograms: allPrograms, allFilter: true));
        // add(AllPrograms());
      },
      (failure) => emit(LoyaltyProgramError(failure.toString())),
    );
  }

  // Filter event: display all programs
  void _onAllPrograms(AllPrograms event, Emitter<LoyaltyProgramState> emit) {
    if (state is LoyaltyProgramLoaded) {
      final loaded = state as LoyaltyProgramLoaded;
      final allPrograms = loaded.listOfPrograms.values.expand((list) => list).toList();
      emit(LoyaltyProgramLoaded(listOfPrograms: loaded.listOfPrograms, selectedPrograms: allPrograms, allFilter: true, selectedFilterProgram: ProgramType.unknown));
    }
  }

  void _onFilterProgram(FilterProgram event, Emitter<LoyaltyProgramState> emit) {
    if (state is LoyaltyProgramLoaded) {
      final loaded = state as LoyaltyProgramLoaded;
      final filteredPrograms = loaded.listOfPrograms[event.program] ?? [];
      emit(LoyaltyProgramLoaded(listOfPrograms: loaded.listOfPrograms, selectedPrograms: filteredPrograms, allFilter: false, selectedFilterProgram: event.program));
    }
  }

}
