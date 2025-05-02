import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../services/helpers/discount_type_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../../services/helpers/reward_type_enum.dart';

part 'loyalty_program_event.dart';

part 'loyalty_program_state.dart';

class LoyaltyProgramBloc extends Bloc<LoyaltyProgramEvent, LoyaltyProgramState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;

  LoyaltyProgramBloc({required this.loyaltyProgramRepository}) : super(LoyaltyProgramState.initial()) {
    on<LoadLoyaltyPrograms>(_loadPrograms);
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<NumHolesChanged>(_onNumHolesChanged);
    on<WinningStampChanged>(_onWinningStampChanged);
    on<NameChanged>(_onNameChanged);
    on<PointValueChanged>(_onPointValueChanged);
    on<DeleteReward>(_onDeleteReward);
    on<AddReward>(_onAddReward);
    on<SubmitLoyaltyProgram>(_onSubmitLoyaltyProgram);
    on<ResetForms>(_onResetBloc);
  }

  _loadPrograms(LoadLoyaltyPrograms event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await loyaltyProgramRepository.getLoyaltyProgram();
    response.fold(
      (loyaltyPrograms) => emit(state.copyWith(status: Status.loaded, message: 'Program loaded', listOfPrograms: loyaltyPrograms)),
      (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
    );
  }

  _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final LoyaltyProgramEntity updatedLoyaltyProgram;
    if (event.programType == ProgramType.stamp) {
      updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(type: event.programType, pointValue: Value(null));
      emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
    } else if (event.programType == ProgramType.points) {
      updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(type: event.programType, numberHoles: Value(null), winningNumbers: Value(null));
      emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
    }
  }

  _onNumHolesChanged(NumHolesChanged event, Emitter<LoyaltyProgramState> emit) {
    final List<int> winningNumbers = List.from(state.loyaltyProgramEntity!.winningNumbers ?? []);

    // Removed a number from winning number list when user reduced the number of holes and the number was in the winning number list
    if (event.deletedNumber != null) {
      final List<int> numbersToBeDeleted = winningNumbers.where((number) => number >= event.deletedNumber!.toInt()).toList();
      winningNumbers.removeWhere((number) => numbersToBeDeleted.contains(number));
    }

    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(pointValue: Value(null), numberHoles: Value(event.numHoles), winningNumbers: Value(winningNumbers));
    emit(state.copyWith(status: Status.ongoing, message: 'Stamp changed', loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onWinningStampChanged(WinningStampChanged event, Emitter<LoyaltyProgramState> emit) async {
    final List<int> winningNumbers = List.from(state.loyaltyProgramEntity!.winningNumbers ?? []);

    // Add a new number or remove already present one
    if (winningNumbers.contains(event.winningNumbers)) {
      winningNumbers.remove(event.winningNumbers);
    } else {
      winningNumbers.add(event.winningNumbers);
    }

    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(winningNumbers: Value(winningNumbers));
    emit(state.copyWith(status: Status.ongoing, message: 'Winning number changed', loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onNameChanged(NameChanged event, Emitter<LoyaltyProgramState> emit) async {
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(name: event.name);
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onPointValueChanged(PointValueChanged event, Emitter<LoyaltyProgramState> emit) async {
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(pointValue: Value(event.pointValue));
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onAddReward(AddReward event, Emitter<LoyaltyProgramState> emit) {
    emit(state.copyWith(rewardStatus: RewardStatus.loading));
    final List<RewardEntity> updateRewardList = List.from(state.rewardEntityList!);
    updateRewardList.add(event.rewardEntity);
    emit(state.copyWith(rewardStatus: RewardStatus.added, rewardEntityList: updateRewardList));
  }

  _onDeleteReward(DeleteReward event, Emitter<LoyaltyProgramState> emit) {
    final List<RewardEntity> rewardList = List.from(state.rewardEntityList!);

    if (rewardList.contains(event.reward)) {
      rewardList.remove(event.reward);
      emit(state.copyWith(rewardEntityList: rewardList));
    }
  }

  _onSubmitLoyaltyProgram(SubmitLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await loyaltyProgramRepository.createLoyaltyProgram(
      loyaltyProgramEntity: state.loyaltyProgramEntity!,
      rewardList: state.rewardEntityList!,
    );
    response.fold(
      (loyaltyProgram) => emit(state.copyWith(status: Status.success)),
      (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
    );
  }

  _onResetBloc(ResetForms event, Emitter<LoyaltyProgramState> emit) {
    emit(LoyaltyProgramState.initial());
  }
}
