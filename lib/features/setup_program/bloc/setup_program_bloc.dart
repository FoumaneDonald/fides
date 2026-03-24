import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/loyalty_program_entity.dart';
import '../../../domain/entities/return_entity.dart';
import '../../../domain/entities/reward_entity.dart';
import '../../../domain/entities/spend_entity.dart';
import '../../../domain/repositories/loyalty_program_repository.dart';
import '../../../services/helpers/discount_type_enum.dart';
import '../../../services/helpers/program_type_enum.dart';
import '../../../services/helpers/reward_type_enum.dart';

part 'setup_program_event.dart';
part 'setup_program_state.dart';

class SetupProgramBloc extends Bloc<SetupProgramEvent, SetupProgramState> {
  final LoyaltyProgramRepository loyaltyProgramRepository;
  final Uuid uuid;

  SetupProgramBloc(this.loyaltyProgramRepository, this.uuid) : super(SetupProgramInitial()) {
    on<SelectedLoyaltyProgram>(_onSelectedLoyaltyProgram);
    on<TotalReturnsChanged>(_onNumHolesChanged);
    on<WinningStampChanged>(_onWinningStampChanged);
    on<SelectedReturnRewardChanged>(_onSelectedReturnRewardChanged);
    on<NameChanged>(_onNameChanged);
    on<ValidityPeriodChanged>(_onLastingDateChanged);
    on<PointsChanged>(_onPointsChanged);
    on<MinimumSpentChanged>(_onMinimumSpentChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<DeleteReward>(_onDeleteReward);
    on<AddReward>(_onAddReward);
    on<SubmitLoyaltyProgram>(_onSubmitLoyaltyProgram);
  }

  Future<void> _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<SetupProgramState> emit) async {
    switch (event.programType) {
      case ProgramType.returning:
        emit(LoyaltyProgramEditing(
          programType: event.programType,
          program: ReturnEntity.init(uuid.v4()),
        ));
        break;
      case ProgramType.spend:
        emit(LoyaltyProgramEditing(
          programType: event.programType,
          program: SpendEntity.init(uuid.v4()),
        ));
        break;
      case ProgramType.unknown:
        emit(const SetupProgramError('Wrong program'));
        break;
    }
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      LoyaltyProgramEntity currentProgram = editing.program;

      emit(editing.copyWith(program: currentProgram.cloneWith(name: event.name)));
    }
  }

  Future<void> _onLastingDateChanged(ValidityPeriodChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      LoyaltyProgramEntity currentProgram = editing.program;

      emit(editing.copyWith(program: currentProgram.cloneWith(validityMonth: event.value)));
    }
  }

  void _onNumHolesChanged(TotalReturnsChanged event, Emitter<SetupProgramState> emit) {
    final current = state;
    if (current is! LoyaltyProgramEditing || current.programType != ProgramType.returning || current.program is! ReturnEntity) {
      return;
    }

    final ReturnEntity returnEntity = current.program as ReturnEntity;

    /*This allows us to detect whether the user reduced the number.*/
    final oldHoles = returnEntity.totalReturns; // Current number stored in state
    final newHoles = event.returns; // What the user just entered

    // Get the current winning numbers
    List<int> winningReturns = List.from(returnEntity.rewardingReturns);
    int? selectedReturn = current.selectReturnNumber;

    // If User Reduced the Number
    if (newHoles < oldHoles) {
      final deletedFrom = newHoles + 1;

      // It creates a new list that removes all winning numbers that are no longer valid after the user reduced the total number of holes.
      winningReturns = winningReturns.where((number) => number < deletedFrom).toList();

      // It finds all rewards that unlock at a return number that no longer exists after reducing the total returns, so they can be deleted.
      final rewardsToDelete = returnEntity.rewards.where((reward) => reward.unlockThreshold >= deletedFrom).toList();

      for (final reward in rewardsToDelete) {
        add(DeleteReward(reward));
      }

      // If the currently selected winning number was deleted:
      // Select the first valid one
      // Or null if none exist
      if (!winningReturns.contains(selectedReturn)) {
        selectedReturn = winningReturns.isNotEmpty ? winningReturns.first : null;
      }
    }

    final updateProgram = returnEntity.copyWith(numberHoles: event.returns, winningNumbers: winningReturns);
    emit(current.copyWith(program: updateProgram, selectReturnNumber: selectedReturn));
  }

  Future<void> _onWinningStampChanged(WinningStampChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.returning && editing.program is ReturnEntity) {
        final ReturnEntity stampEntity = editing.program as ReturnEntity;
        int? selectedStampReward = editing.selectReturnNumber;

        // get the current winning numbers
        final List<int> winningNumbers = List.from(stampEntity.rewardingReturns);

        // Add a new number or remove already present one
        if (winningNumbers.contains(event.winningNumber)) {
          winningNumbers.remove(event.winningNumber);

          // Delete associated reward to the winning number
          final RewardEntity rewardToDelete = stampEntity.rewards.firstWhere((reward) => reward.unlockThreshold == event.winningNumber);
          add(DeleteReward(rewardToDelete));

          // Change the selected winning stamp chip to the first one in the list if there is
          selectedStampReward = editing.selectReturnNumber == event.winningNumber ? winningNumbers.firstOrNull : editing.selectReturnNumber;
        } else {
          winningNumbers.add(event.winningNumber);
        }

        final updatedStampProgram = stampEntity.copyWith(winningNumbers: winningNumbers);
        emit(editing.copyWith(program: updatedStampProgram, selectReturnNumber: selectedStampReward));
      } else {
        emit(const SetupProgramError('Wrong program'));
      }
    }
  }

  void _onSelectedReturnRewardChanged(SelectedReturnRewardChanged event, Emitter<SetupProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      emit(editing.copyWith(selectReturnNumber: event.selectReturnNumber));
    }
  }

  Future<void> _onPointsChanged(PointsChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final SpendEntity pointsProgram = editing.program as SpendEntity;

        final updatedPointsProgram = pointsProgram.copyWith(points: event.pointValue);

        emit(editing.copyWith(program: updatedPointsProgram));
      } else {
        emit(const SetupProgramError('Wrong program'));
      }
    }
  }

  Future<void> _onMinimumSpentChanged(MinimumSpentChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final SpendEntity pointsProgram = editing.program as SpendEntity;

        final updatedPointsProgram = pointsProgram.copyWith(minimumSpent: event.minimumSpent);

        emit(editing.copyWith(program: updatedPointsProgram));
      } else {
        emit(const SetupProgramError('Wrong program'));
      }
    }
  }

  Future<void> _onCurrencyChanged(CurrencyChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      if (editing.programType == ProgramType.spend && editing.program is SpendEntity) {
        final SpendEntity pointsProgram = editing.program as SpendEntity;

        final updatedPointsProgram = pointsProgram.copyWith(currencyCode: event.currency);

        emit(editing.copyWith(program: updatedPointsProgram));
      } else {
        emit(const SetupProgramError('Wrong program'));
      }
    }
  }

  void _onAddReward(AddReward event, Emitter<SetupProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      emit(editing.copyWith(rewardStatus: RewardStatus.loading));

      final rewardEntity = RewardEntity(
        rewardId: uuid.v4(),
        type: event.type,
        unlockThreshold: event.unlockThreshold,
        discountValue: event.discountValue,
        discountType: event.discountType,
        item: event.item,
        imagePath: event.imagePath,
        description: event.description,
        minimumPurchase: event.minimumPurchase,
      );

      LoyaltyProgramEntity currentProgram = editing.program;

      final List<RewardEntity> currentRewards = List.from(currentProgram.rewards);
      // add the new reward to the current list of rewards
      currentRewards.add(rewardEntity);

      emit(editing.copyWith(rewardStatus: RewardStatus.added, program: currentProgram.cloneWith(rewards: currentRewards)));
    }
  }

  void _onDeleteReward(DeleteReward event, Emitter<SetupProgramState> emit) {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;
      final List<RewardEntity> rewardList = List.from(editing.program.rewards);

      if (rewardList.contains(event.reward)) {
        rewardList.remove(event.reward);
        emit(editing.copyWith(program: editing.program.cloneWith(rewards: rewardList)));
      }
    }
  }

  Future<void> _onSubmitLoyaltyProgram(SubmitLoyaltyProgram event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      emit(editing.copyWith(status: Status.loading));

      final response = await loyaltyProgramRepository.createProgram(editing.program);
      response.fold(
        (loyaltyProgram) => emit(editing.copyWith(status: Status.success)),
        (failure) => emit(SetupProgramError(failure.toString())),
      );
    }
  }
}
