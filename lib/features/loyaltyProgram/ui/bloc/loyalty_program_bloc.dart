import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:fides/core/enums/time_units.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/entities/returnEntity/return_entity.dart';
import '../../../../domain/entities/reward_entity.dart';
import '../../../../domain/entities/spendEntity/spend_entity.dart';
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
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<NumHolesChanged>(_onNumHolesChanged);
    on<WinningStampChanged>(_onWinningStampChanged);
    on<SelectedReturnRewardChanged>(_onSelectedReturnRewardChanged);
    on<NameChanged>(_onNameChanged);
    on<LastingDateChanged>(_onLastingDateChanged);
    on<PointsChanged>(_onPointsChanged);
    on<MinimumSpentChanged>(_onMinimumSpentChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<DeleteReward>(_onDeleteReward);
    on<AddReward>(_onAddReward);
    on<SubmitLoyaltyProgram>(_onSubmitLoyaltyProgram);
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

  Future<void> _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    switch (event.programType) {
      case ProgramType.returning:
        emit(LoyaltyProgramEditing(
          programType: event.programType,
          program: ReturnEntity(name: '', type: event.programType, numberHoles: 5, winningNumbers: [3, 5], rewards: [], lastingNumber: 1, lastingPeriod: TimeUnit.months),
        ));
        break;
      case ProgramType.spend:
        emit(LoyaltyProgramEditing(
          programType: event.programType,
          program: SpendEntity(name: '', type: event.programType, currencyCode: 'XAF', rewards: [], lastingNumber: 1, lastingPeriod: TimeUnit.months),
        ));
        break;
      case ProgramType.unknown:
        emit(const LoyaltyProgramError('Wrong program'));
        break;
    }
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      LoyaltyProgramEntity currentProgram = editing.program;

      emit(editing.copyWith(program: currentProgram.cloneWith(name: event.name)));
    }
  }

  Future<void> _onLastingDateChanged(LastingDateChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      LoyaltyProgramEntity currentProgram = editing.program;

      emit(editing.copyWith(program: currentProgram.cloneWith(lastingNumber: event.lastingNumber, lastingPeriod: event.lastingPeriod)));
    }
  }

  void _onNumHolesChanged(NumHolesChanged event, Emitter<LoyaltyProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.returning && editing.program is ReturnEntity) {
        final ReturnEntity stampEntity = editing.program as ReturnEntity;
        int? selectedStampReward = editing.selectReturnNumber;

        // Get the current winning numbers
        final List<int> winningNumbers = List.from(stampEntity.winningNumbers);

        // Removed a number from winning number list when user reduced the number of holes and the number was in the winning number list
        if (event.deletedFromHereOn != null) {
          winningNumbers.removeWhere((number) => number >= event.deletedFromHereOn!);

          final rewardsToDelete = stampEntity.rewards.where((reward) => reward.stampNumber != null && reward.stampNumber! >= event.deletedFromHereOn!).toList();

          for (final reward in rewardsToDelete) {
            add(DeleteReward(reward));
          }

          // Change the selected winning stamp chip to the first one in the list if there is
          selectedStampReward = winningNumbers.contains(editing.selectReturnNumber) ? editing.selectReturnNumber : winningNumbers.firstOrNull;
        }

        final updatedStampProgram = stampEntity.copyWith(numberHoles: event.numHoles, winningNumbers: winningNumbers);
        emit(editing.copyWith(program: updatedStampProgram, selectReturnNumber: selectedStampReward));
      } else {
        emit(const LoyaltyProgramError('Wrong program'));
      }
    }
  }

  Future<void> _onWinningStampChanged(WinningStampChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.returning && editing.program is ReturnEntity) {
        final ReturnEntity stampEntity = editing.program as ReturnEntity;
        int? selectedStampReward = editing.selectReturnNumber;

        // get the current winning numbers
        final List<int> winningNumbers = List.from(stampEntity.winningNumbers);

        // Add a new number or remove already present one
        if (winningNumbers.contains(event.winningNumber)) {
          winningNumbers.remove(event.winningNumber);

          // Delete associated reward to the winning number
          final RewardEntity rewardToDelete = stampEntity.rewards.firstWhere(
            (reward) => reward.stampNumber == event.winningNumber
          );
          add(DeleteReward(rewardToDelete));

          // Change the selected winning stamp chip to the first one in the list if there is
          selectedStampReward = editing.selectReturnNumber == event.winningNumber ? winningNumbers.firstOrNull : editing.selectReturnNumber;
        } else {
          winningNumbers.add(event.winningNumber);
        }

        final updatedStampProgram = stampEntity.copyWith(winningNumbers: winningNumbers);
        emit(editing.copyWith(program: updatedStampProgram, selectReturnNumber: selectedStampReward));
      } else {
        emit(const LoyaltyProgramError('Wrong program'));
      }
    }
  }

  void _onSelectedReturnRewardChanged(SelectedReturnRewardChanged event, Emitter<LoyaltyProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      emit(editing.copyWith(selectReturnNumber: event.selectReturnNumber));
    }
  }

  Future<void> _onPointsChanged(PointsChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final SpendEntity pointsProgram = editing.program as SpendEntity;

        final updatedPointsProgram = pointsProgram.copyWith(points: event.pointValue);

        emit(editing.copyWith(program: updatedPointsProgram));
      } else {
        emit(const LoyaltyProgramError('Wrong program'));
      }
    }
  }

  Future<void> _onMinimumSpentChanged(MinimumSpentChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final SpendEntity pointsProgram = editing.program as SpendEntity;

        final updatedPointsProgram = pointsProgram.copyWith(minimumSpent: event.minimumSpent);

        emit(editing.copyWith(program: updatedPointsProgram));
      } else {
        emit(const LoyaltyProgramError('Wrong program'));
      }
    }
  }

  Future<void> _onCurrencyChanged(CurrencyChanged event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final SpendEntity pointsProgram = editing.program as SpendEntity;

        final updatedPointsProgram = pointsProgram.copyWith(currencyCode: event.currency);

        emit(editing.copyWith(program: updatedPointsProgram));
      } else {
        emit(const LoyaltyProgramError('Wrong program'));
      }
    }
  }

  void _onAddReward(AddReward event, Emitter<LoyaltyProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      emit(editing.copyWith(rewardStatus: RewardStatus.loading));

      LoyaltyProgramEntity currentProgram = editing.program;

      final List<RewardEntity> currentRewards = List.from(currentProgram.rewards);
      // add the new reward to the current list of rewards
      currentRewards.add(event.rewardEntity);

      emit(editing.copyWith(rewardStatus: RewardStatus.added, program: currentProgram.cloneWith(rewards: currentRewards)));
    }
  }

  void _onDeleteReward(DeleteReward event, Emitter<LoyaltyProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;
      final List<RewardEntity> rewardList = List.from(editing.program.rewards);

      if (rewardList.contains(event.reward)) {
        rewardList.remove(event.reward);
        emit(editing.copyWith(program: editing.program.cloneWith(rewards: rewardList)));
      }
    }
  }

  Future<void> _onSubmitLoyaltyProgram(SubmitLoyaltyProgram event, Emitter<LoyaltyProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      emit(editing.copyWith(status: Status.loading));

      if (editing.programType == ProgramType.returning && editing.program is ReturnEntity) {
        final response = await loyaltyProgramRepository.createReturnProgram(returnEntity: editing.program as ReturnEntity);
        response.fold(
          (loyaltyProgram) => emit(editing.copyWith(status: Status.success)),
          (failure) => emit(LoyaltyProgramError(failure.toString())),
        );
      } else if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final response = await loyaltyProgramRepository.createSpendProgram(spendEntity: editing.program as SpendEntity);
        response.fold(
          (loyaltyProgram) => emit(editing.copyWith(status: Status.success)),
          (failure) => emit(LoyaltyProgramError(failure.toString())),
        );
      } else {
        emit(editing.copyWith(status: Status.error, message: 'Wrong program'));
      }
    }
  }
}
