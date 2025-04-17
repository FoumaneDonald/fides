import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../services/helpers/discount_type_enum.dart';
import '../../../../services/helpers/reward_type_enum.dart';

part 'loyalty_program_event.dart';

part 'loyalty_program_state.dart';

class LoyaltyProgramBloc extends Bloc<LoyaltyProgramEvent, LoyaltyProgramState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;

  LoyaltyProgramBloc({required this.loyaltyProgramRepository}) : super(LoyaltyProgramState.initial()) {
    on<LoadLoyaltyPrograms>(_loadPrograms);
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<NumHolesChanged>(_onNumHolesChanged);
    on<AboutStampProgramChanged>(_onAboutStampProgramChanged);
    on<AboutPointProgramChanged>(_onAboutPointProgramChanged);
    on<RewardTypeChanged>(_onRewardTypeChanged);
    on<RewardDiscountValueChanged>(_onRewardDiscountValueChanged);
    on<RewardDiscountTypeChanged>(_onRewardDiscountTypeChanged);
    on<RewardItemChanged>(_onRewardItemChanged);
    on<RewardDescriptionChanged>(_onRewardDescriptionChanged);
    on<RewardCostChanged>(_onRewardCostChanged);
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
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(type: event.programName);
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onNumHolesChanged(NumHolesChanged event, Emitter<LoyaltyProgramState> emit) {
    final List<int> winningNumbers = List.from(state.loyaltyProgramEntity!.winningNumbers ?? []);

    // Removed a number from winning number list when user reduced the number of holes and the number was in the winning number list
    if (event.deletedNumber != null) {
      final List<int> numbersToBeDeleted = winningNumbers.where((number) => number >= event.deletedNumber!.toInt()).toList();
      winningNumbers.removeWhere((number) => numbersToBeDeleted.contains(number));
    }

    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(pointValue: Value(null), numberHoles: Value(event.numHoles), winningNumbers: Value(winningNumbers));
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onAboutStampProgramChanged(AboutStampProgramChanged event, Emitter<LoyaltyProgramState> emit) async {
    final List<int> winningNumbers = List.from(state.loyaltyProgramEntity!.winningNumbers ?? []);

    // Add a new number or remove already present one
    if (event.winningNumbers != null) {
      if (winningNumbers.contains(event.winningNumbers)) {
        winningNumbers.remove(event.winningNumbers);
      } else {
        winningNumbers.add(event.winningNumbers!);
      }
    }

    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(name: event.name, pointValue: Value(null), winningNumbers: Value(winningNumbers));
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onAboutPointProgramChanged(AboutPointProgramChanged event, Emitter<LoyaltyProgramState> emit) async {
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(name: event.name, pointValue: Value(event.pointValue), numberHoles: Value(null), winningNumbers: Value(null));
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onRewardTypeChanged(RewardTypeChanged event, Emitter<LoyaltyProgramState> emit) {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      type: event.type,
    );
    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }

  _onRewardDiscountValueChanged(RewardDiscountValueChanged event, Emitter<LoyaltyProgramState> emit) {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      discountValue: state.rewardEntity!.type == RewardType.free ? Value(null) : Value(event.discountValue),
    );
    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }

  _onRewardDiscountTypeChanged(RewardDiscountTypeChanged event, Emitter<LoyaltyProgramState> emit) {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      discountType: state.rewardEntity!.type == RewardType.free ? Value(null) : Value(event.discountType),
    );
    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }

  _onRewardItemChanged(RewardItemChanged event, Emitter<LoyaltyProgramState> emit) {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      item: event.item,
    );
    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }

  _onRewardDescriptionChanged(RewardDescriptionChanged event, Emitter<LoyaltyProgramState> emit) {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      description: event.description,
    );
    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }

  _onRewardCostChanged(RewardCostChanged event, Emitter<LoyaltyProgramState> emit) {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      rewardCost: state.rewardEntity!.type == RewardType.free ? Value(null) : Value(event.rewardCost),
    );
    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }

  _onSubmitLoyaltyProgram(SubmitLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await loyaltyProgramRepository.createLoyaltyProgram(
      loyaltyProgramEntity: state.loyaltyProgramEntity!,
      reward: state.rewardEntity!,
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
