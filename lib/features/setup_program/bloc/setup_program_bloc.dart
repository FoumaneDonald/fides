import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../core/enums/time_units.dart';
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

  Future<void> _onSelectedLoyaltyProgram(SelectedLoyaltyProgram event, Emitter<SetupProgramState> emit) async {
    switch (event.programType) {
      case ProgramType.returning:
        emit(LoyaltyProgramEditing(
          programType: event.programType,
          program: ReturnEntity(name: '', numberHoles: 5, winningNumbers: [3, 5], rewards: [], lastingNumber: 1, lastingPeriod: TimeUnit.months, programId: ''),
        ));
        break;
      case ProgramType.spend:
        emit(LoyaltyProgramEditing(
          programType: event.programType,
          program: SpendEntity(name: '', currencyCode: 'XAF', rewards: [], lastingNumber: 1, lastingPeriod: TimeUnit.months, programId: ''),
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

  Future<void> _onLastingDateChanged(LastingDateChanged event, Emitter<SetupProgramState> emit) async {
    if (state is LoyaltyProgramEditing) {
      final editing = state as LoyaltyProgramEditing;

      LoyaltyProgramEntity currentProgram = editing.program;

      emit(editing.copyWith(
          program: currentProgram.cloneWith(lastingNumber: event.lastingNumber ?? editing.program.lastingNumber, lastingPeriod: event.lastingPeriod ?? editing.program.lastingPeriod)));
    }
  }

  void _onNumHolesChanged(NumHolesChanged event, Emitter<SetupProgramState> emit) {
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

          final rewardsToDelete = stampEntity.rewards.where((reward) => reward.unlockThreshold >= event.deletedFromHereOn!).toList();

          for (final reward in rewardsToDelete) {
            add(DeleteReward(reward));
          }

          // Change the selected winning stamp chip to the first one in the list if there is
          selectedStampReward = winningNumbers.contains(editing.selectReturnNumber) ? editing.selectReturnNumber : winningNumbers.firstOrNull;
        }

        final updatedStampProgram = stampEntity.copyWith(numberHoles: event.numHoles, winningNumbers: winningNumbers);
        emit(editing.copyWith(program: updatedStampProgram, selectReturnNumber: selectedStampReward));
      } else {
        emit(const SetupProgramError('Wrong program'));
      }
    }
  }

  Future<void> _onWinningStampChanged(WinningStampChanged event, Emitter<SetupProgramState> emit) async {
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
