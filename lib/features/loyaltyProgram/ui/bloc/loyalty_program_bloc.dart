import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/data/entities/rewardEntity.dart';

import '../../../../data/entities/loyaltyProgramEntity.dart';
import '../../../../data/repositories/LoyaltyProgramRepository.dart';

part 'loyalty_program_event.dart';
part 'loyalty_program_state.dart';

class LoyaltyProgramBloc extends Bloc<LoyaltyProgramEvent, LoyaltyProgramState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;

  LoyaltyProgramBloc({required this.loyaltyProgramRepository}) : super(LoyaltyProgramState.initial()) {
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<AboutStampProgramChanged>(_onAboutStampProgramChanged);
    on<RewardChanges>(_onRewardChanges);
  }

  _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(type: event.programName);
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onAboutStampProgramChanged(AboutStampProgramChanged event, Emitter<LoyaltyProgramState> emit) async {
    final List<int> winningNumbers = state.loyaltyProgramEntity!.winningNumbers ?? [];
    final updatedRewardEntity = state.rewardEntity!.copyWith(type: event.test);

    if (event.winningNumbers != null) {
      if (winningNumbers.contains(event.winningNumbers)) {
        winningNumbers.remove(event.winningNumbers);
      } else {
        winningNumbers.add(event.winningNumbers!);
      }
    }

    if (event.deletedNumber != null) {
      final List<int> numbersToBeDeleted = winningNumbers.where((number) => number >= event.deletedNumber!.toInt()).toList();
      winningNumbers.removeWhere((number) => numbersToBeDeleted.contains(number));
    }

    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(name: event.name, numberHoles: event.numHoles, winningNumbers: winningNumbers);
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram, rewardEntity: updatedRewardEntity));
  }

  _onRewardChanges(RewardChanges event, Emitter<LoyaltyProgramState> emit) async {
    final updatedRewardEntity = state.rewardEntity!.copyWith(
      type: event.type,
      discountValue: state.rewardEntity!.type == 'Free' ? Value(null) : Value(event.discountValue),
      discountType: state.rewardEntity!.type == 'Free' ? Value(null) : Value(event.discountType),
      item: event.item,
      description: event.description,
      rewardCost: event.rewardCost,
      minimumPurchase: event.minPurchase,
    );

    if (event.submit) {
      emit(state.copyWith(status: Status.loading));
      final response = await loyaltyProgramRepository.createLoyaltyProgram(
        loyaltyProgramEntity: state.loyaltyProgramEntity!,
        reward: state.rewardEntity!,
      );
      response.fold(
        (loyaltyProgram) => emit(state.copyWith(status: Status.done)),
        (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
      );
    }

    emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
  }
}
