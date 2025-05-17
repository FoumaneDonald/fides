import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/domain/entities/reward_entity.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/entities/points_entity.dart';
import '../../../../domain/entities/stamp_entity.dart';
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
    on<AllPrograms>(_onAllPrograms);
    on<FilterProgram>(_onFilterProgram);
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<NumHolesChanged>(_onNumHolesChanged);
    on<WinningStampChanged>(_onWinningStampChanged);
    on<NameChanged>(_onNameChanged);
    on<PointsChanged>(_onPointsChanged);
    on<MinimumSpentChanged>(_onMinimumSpentChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<DeleteReward>(_onDeleteReward);
    on<AddReward>(_onAddReward);
    on<SubmitLoyaltyProgram>(_onSubmitLoyaltyProgram);
    on<ResetForms>(_onResetBloc);
  }

  _loadPrograms(LoadLoyaltyPrograms event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await loyaltyProgramRepository.getLoyaltyProgram();
    response.fold(
      (loyaltyPrograms) {
        emit(state.copyWith(status: Status.loaded, message: 'Program loaded', listOfPrograms: loyaltyPrograms));
        add(AllPrograms());
      },
      (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
    );
  }

  _onAllPrograms(AllPrograms event, Emitter<LoyaltyProgramState> emit) {
    final List<LoyaltyProgramEntity> allPrograms = state.listOfPrograms!.values.expand((list) => list).toList();
    emit(state.copyWith(status: Status.loaded, listOfSelectedProgram: allPrograms, allFilter: true, selectedFilterProgram: ProgramType.unknown));
  }

  _onFilterProgram(FilterProgram event, Emitter<LoyaltyProgramState> emit) {
    final List<LoyaltyProgramEntity> filteredProgram = state.listOfPrograms![event.program]!;
    emit(state.copyWith(status: Status.loaded, listOfSelectedProgram: filteredProgram, allFilter: false, selectedFilterProgram: event.program));
  }

  _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.loading));

    switch (event.programType) {
      case ProgramType.stamp:
        emit(state.copyWith(status: Status.ongoing, selectedProgramType: event.programType, loyaltyProgramEntity: StampEntity(name: state.loyaltyProgramEntity!.name, type: event.programType, numberHoles: 5, winningNumbers: [3, 5])));
        break;
      case ProgramType.points:
        emit(state.copyWith(status: Status.ongoing, selectedProgramType: event.programType, loyaltyProgramEntity: PointsEntity(name: state.loyaltyProgramEntity!.name, type: event.programType, currencyCode: 'XAF')));
        break;
      case ProgramType.unknown:
        emit(state.copyWith(status: Status.error, message: 'Wrong program'));
        break;
    }
  }

  _onNameChanged(NameChanged event, Emitter<LoyaltyProgramState> emit) async {
    emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: state.loyaltyProgramEntity!.copyWith(name: event.name)));
  }

  _onNumHolesChanged(NumHolesChanged event, Emitter<LoyaltyProgramState> emit) {
    if (state.selectedProgramType == ProgramType.stamp && state.loyaltyProgramEntity is StampEntity) {
      final StampEntity stampProgram = state.loyaltyProgramEntity as StampEntity;

      final List<int> winningNumbers = List.from(stampProgram.winningNumbers ?? []);

      // Removed a number from winning number list when user reduced the number of holes and the number was in the winning number list
      if (event.deletedNumber != null) {
        final List<int> numbersToBeDeleted = winningNumbers.where((number) => number >= event.deletedNumber!.toInt()).toList();
        winningNumbers.removeWhere((number) => numbersToBeDeleted.contains(number));
      }

      final updatedStampProgram = stampProgram.copyWith(numberHoles: event.numHoles, winningNumbers: winningNumbers);
      emit(state.copyWith(status: Status.ongoing, message: 'Stamp changed', loyaltyProgramEntity: updatedStampProgram));
    } else {
      emit(state.copyWith(status: Status.error, message: 'Wrong program'));
    }
  }

  _onWinningStampChanged(WinningStampChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state.selectedProgramType == ProgramType.stamp && state.loyaltyProgramEntity is StampEntity) {
      final StampEntity stampProgram = state.loyaltyProgramEntity as StampEntity;

      final List<int> winningNumbers = List.from(stampProgram.winningNumbers ?? []);

      // Add a new number or remove already present one
      if (winningNumbers.contains(event.winningNumbers)) {
        winningNumbers.remove(event.winningNumbers);
      } else {
        winningNumbers.add(event.winningNumbers);
      }

      final updatedStampProgram = stampProgram.copyWith(winningNumbers: winningNumbers);

      emit(state.copyWith(status: Status.ongoing, message: 'Winning number changed', loyaltyProgramEntity: updatedStampProgram));
    } else {
      emit(state.copyWith(status: Status.error, message: 'Wrong program'));
    }
  }

  _onPointsChanged(PointsChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state.selectedProgramType == ProgramType.points && state.loyaltyProgramEntity is PointsEntity) {
      final PointsEntity pointsProgram = state.loyaltyProgramEntity as PointsEntity;

      final updatedPointsProgram = pointsProgram.copyWith(points: event.pointValue);

      emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedPointsProgram));
    } else {
      emit(state.copyWith(status: Status.error, message: 'Wrong program'));
    }
  }

  _onMinimumSpentChanged(MinimumSpentChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state.selectedProgramType == ProgramType.points && state.loyaltyProgramEntity is PointsEntity) {
      final PointsEntity pointsProgram = state.loyaltyProgramEntity as PointsEntity;

      final updatedPointsProgram = pointsProgram.copyWith(minimumSpent: event.minimumSpent);

      emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedPointsProgram));
    } else {
      emit(state.copyWith(status: Status.error, message: 'Wrong program'));
    }
  }

  _onCurrencyChanged(CurrencyChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state.selectedProgramType == ProgramType.points && state.loyaltyProgramEntity is PointsEntity) {
      final PointsEntity pointsProgram = state.loyaltyProgramEntity as PointsEntity;

      final updatedPointsProgram = pointsProgram.copyWith(currencyCode: event.currency);

      emit(state.copyWith(status: Status.ongoing, loyaltyProgramEntity: updatedPointsProgram));
    } else {
      emit(state.copyWith(status: Status.error, message: 'Wrong program'));
    }
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

    if (state.selectedProgramType == ProgramType.stamp && state.loyaltyProgramEntity is StampEntity) {
      final response = await loyaltyProgramRepository.createStampProgram(
        stampEntity: state.loyaltyProgramEntity! as StampEntity,
        rewardList: state.rewardEntityList!,
      );
      response.fold(
        (loyaltyProgram) => emit(state.copyWith(status: Status.success)),
        (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
      );
    } else if (state.selectedProgramType == ProgramType.points && state.loyaltyProgramEntity is PointsEntity) {
      final response = await loyaltyProgramRepository.createPointsProgram(
        pointsEntity: state.loyaltyProgramEntity! as PointsEntity,
        rewardList: state.rewardEntityList!,
      );
      response.fold(
        (loyaltyProgram) => emit(state.copyWith(status: Status.success)),
        (failure) => emit(state.copyWith(status: Status.error, message: failure.toString())),
      );
    } else {
      emit(state.copyWith(status: Status.error, message: 'Wrong program'));
    }
  }

  _onResetBloc(ResetForms event, Emitter<LoyaltyProgramState> emit) {
    emit(LoyaltyProgramState.initial());
  }
}
