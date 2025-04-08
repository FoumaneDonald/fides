import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/data/entities/rewardEntity.dart';

import '../../../../data/entities/loyaltyProgramEntity.dart';
import '../../../../data/repositories/LoyaltyProgramRepository.dart';

part 'loyaltyProgramEvent.dart';
part 'loyaltyProgramState.dart';

class LoyaltyProgramBloc extends Bloc<LoyaltyProgramEvent, LoyaltyProgramState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;

  LoyaltyProgramBloc({required this.loyaltyProgramRepository}) : super(LoyaltyProgramState.initial()) {
    // on<LoadLoyaltyProgram>(_loadPrograms);
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<AboutStampProgramChanged>(_onAboutStampProgramChanged);
    on<AboutPointProgramChanged>(_onAboutPointProgramChanged);
    on<RewardChanges>(_onRewardChanges);
    on<ResetBloc>(_onResetBloc);
  }

  // _loadPrograms(LoadLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
  //   emit(state.copyWith(status: Status.initial));
  //   final response = await loyaltyProgramRepository.getLoyaltyProgram();
  //   response.fold(
  //     (loyaltyPrograms) => emit(state.copyWith(status: Status.success, message: 'Program loaded', listOfPrograms: loyaltyPrograms)),
  //     (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
  //   );
  // }

  _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(type: event.programName);
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

    // Removed a number from winning number list when user reduced the number of holes and the number was in the winning number list
    if (event.deletedNumber != null) {
      final List<int> numbersToBeDeleted = winningNumbers.where((number) => number >= event.deletedNumber!.toInt()).toList();
      winningNumbers.removeWhere((number) => numbersToBeDeleted.contains(number));
    }

    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(name: event.name, numberHoles: Value(event.numHoles), winningNumbers: Value(winningNumbers));
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
  }

  _onAboutPointProgramChanged(AboutPointProgramChanged event, Emitter<LoyaltyProgramState> emit) async {
    final updatedLoyaltyProgram = state.loyaltyProgramEntity!.copyWith(name: event.name, pointValue: event.pointValue, numberHoles: Value(null), winningNumbers: Value(null));
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedLoyaltyProgram));
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
        (loyaltyProgram) => emit(state.copyWith(status: Status.success)),
        (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
      );
    } else {
      emit(state.copyWith(status: Status.ongoing, rewardEntity: updatedRewardEntity));
    }
  }

  _onResetBloc(ResetBloc event, Emitter<LoyaltyProgramState> emit){
    emit(LoyaltyProgramState.initial());
  }
}
