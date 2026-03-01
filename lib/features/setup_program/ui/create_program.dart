import 'package:currency_picker/currency_picker.dart';
import 'package:fides/domain/entities/spend_entity.dart';
import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:fides/features/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/enums/time_units.dart';
import '../../../domain/entities/return_entity.dart';
import '../../../services/helpers/app_route_enum.dart';
import '../../../services/helpers/program_type_enum.dart';
import '../../core/mixins/validation_mixins.dart';
import '../../core/widgets/fides_app_bar.dart';
import '../../core/widgets/fides_snack_bar.dart';
import '../../core/widgets/fides_text_input.dart';
import '../../core/widgets/fides_text_input_selection.dart';
import '../../core/widgets/required_field_text.dart';
import '../../loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';
import '../bloc/setup_program_bloc.dart';
import '../widgets/add_reward_section.dart';
import '../widgets/build_return_fields.dart';
import '../widgets/build_spend_fields.dart';

class CreateProgram extends StatefulWidget {
  const CreateProgram({super.key});

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> with ValidationMixins {
  /* Form key and focus nodes */
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _pointsFocus = FocusNode();
  final FocusNode _returnNumberFocus = FocusNode();
  final FocusNode _minimumPurchaseFocus = FocusNode();
  final FocusNode _noteFocus = FocusNode();
  final FocusNode _lastingNumberFocus = FocusNode();

  /* Controllers for text fields */
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _returnNumberController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _minimumSpentController = TextEditingController();
  final TextEditingController _lastingNumberController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  // Tracks number of returns(stamps)
  List<int> _returns = [];
  int initialReturnNumber = 0;
  SpendEntity? spendEntity;
  ReturnEntity? returnEntity;
  DateTime? finalDate;

  /// Initialize state and bind UI inputs with BLoC state
  @override
  void initState() {
    super.initState();
    final state = context.read<SetupProgramBloc>().state;

    if (state is LoyaltyProgramEditing) {
      // Name field binding
      _nameController.text = state.program.name;
      _nameController.addListener(() => context.read<SetupProgramBloc>().add(NameChanged(_nameController.text)));

      _lastingNumberController.text = state.program.lastingNumber.toString();
      _lastingNumberController.addListener(() {
        if (_lastingNumberController.text.isNotEmpty) {
          final int toInt = int.parse(_lastingNumberController.text);
          context.read<SetupProgramBloc>().add(LastingDateChanged(lastingNumber: toInt));
        }
      });

      // If current program is a return one
      if (state.programType == ProgramType.returning && state.program is ReturnEntity) {
        returnEntity = state.program as ReturnEntity;
        _returnNumberController.text = returnEntity!.numberHoles.toString();
        // Generate holes/stamps
        _updateReturns(returnEntity!.numberHoles);

        _returnNumberController.addListener(() {
          int? valueInt = int.tryParse(_returnNumberController.text.trim());
          const int maxValue = 50;

          if (valueInt != null) {
            if (valueInt < 0) valueInt = 0;
            if (valueInt > maxValue) valueInt = maxValue;
            context.read<SetupProgramBloc>().add(NumHolesChanged(numHoles: valueInt, deletedFromHereOn: valueInt + 1));
            _updateReturns(valueInt);
          }
        });
      }
      // If current program is a spend one
      else if (state.programType == ProgramType.spend) {
        spendEntity = state.program as SpendEntity;

        _minimumSpentController.text = spendEntity!.minimumSpent?.toString() ?? '';

        _minimumSpentController.addListener(() {
          if (_minimumSpentController.text.isNotEmpty) {
            context.read<SetupProgramBloc>().add(MinimumSpentChanged(double.parse(_minimumSpentController.text)));
          }
        });

        _pointsController.text = spendEntity!.points?.toString() ?? '';

        _pointsController.addListener(() {
          if (_pointsController.text.isNotEmpty) {
            context.read<SetupProgramBloc>().add(PointsChanged(double.parse(_pointsController.text)));
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _pointsFocus.dispose();
    _returnNumberFocus.dispose();
    _nameController.dispose();
    _pointsController.dispose();
    _returnNumberController.dispose();
    super.dispose();
  }

  // Adjust the number of stamp holes (+/-)
  void _addRemoveReturnsNumber(int newNumber) {
    final currentNumber = int.tryParse(_returnNumberController.text) ?? 0;
    final updatedNumber = currentNumber + newNumber;

    // prevent negative number
    if (updatedNumber > 0) {
      _returnNumberController.text = (updatedNumber).toString();
    }
  }

  // Update number of returns
  void _updateReturns(int number) {
    _returns = List.generate(number, (index) => 1 + index);
  }

  // Handle stamp selection toggle for rewards
  void _toggleWinningStamps(int number) {
    context.read<SetupProgramBloc>().add(WinningStampChanged(number));
  }

  bool _isButtonActive(LoyaltyProgramEditing state) {
    bool condition = false;
    bool isNameNotEmpty = _nameController.text.isNotEmpty;
    bool isPointsNotEmpty = _pointsController.text.isNotEmpty;
    bool isMinimumSpentNotEmpty = _minimumSpentController.text.isNotEmpty;

    if (state.programType == ProgramType.returning) {
      final program = state.program as ReturnEntity;
      condition = program.winningNumbers.isNotEmpty &&
          program.winningNumbers.every(
            (number) => program.rewards.any((reward) => reward.unlockThreshold == number),
          ) &&
          isNameNotEmpty &&
          isPointsNotEmpty &&
          isMinimumSpentNotEmpty;
    } else if (state.programType == ProgramType.spend) {
      condition = state.program.rewards.isNotEmpty && isNameNotEmpty && isPointsNotEmpty && isMinimumSpentNotEmpty;
    } else {
      condition = false; // ProgramType.unknown
    }

    return condition;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetupProgramBloc, SetupProgramState>(
      listener: (context, state) {
        final route = ModalRoute.of(context);
        final isCurrentRoute = route?.isCurrent ?? false;

        if (state is LoyaltyProgramEditing && state.status == Status.error) {
          FidesSnackBar.error(context, state.message!);
        } else if (state is SetupProgramError) {
          FidesSnackBar.error(context, state.message);
        }

        if (state is LoyaltyProgramEditing && state.status == Status.success && isCurrentRoute) {
          context.read<LoyaltyProgramBloc>().add(LoadLoyaltyPrograms());
          context.goNamed(AppRoute.programs.name);
        }
      },
      builder: (context, state) {
        if (state is LoyaltyProgramEditing) {
          return Scaffold(
            appBar: FidesAppBar(
              title: 'Set up your ${state.programType.label.toLowerCase()} program',
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: Column(
                    spacing: 40,
                    children: [
                      Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RequiredFieldText(),
                          Form(
                            key: _formKey,
                            child: Column(
                              spacing: 40,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  spacing: 24,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FidesTextInput(
                                      focusNode: _nameFocus,
                                      controller: _nameController,
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      inputLabel: 'Program name*',
                                      validator: requiredField,
                                      autoValidateMode: AutovalidateMode.onUserInteraction,
                                      onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(state.programType == ProgramType.returning ? _returnNumberFocus : _pointsFocus),
                                    ),
                                    switch (state.programType) {
                                      ProgramType.spend => BuildSpendFields(
                                          currencyCode: (state.program as SpendEntity).currencyCode,
                                          pointsFocus: _pointsFocus,
                                          minimumPurchaseFocus: _minimumPurchaseFocus,
                                          pointsController: _pointsController,
                                          minimumSpentController: _minimumSpentController,
                                          validator: composeValidators<String>([requiredField]),
                                          onPressed: () {
                                            showCurrencyPicker(
                                              context: context,
                                              favorite: ['XAF'],
                                              onSelect: (Currency currency) => context.read<SetupProgramBloc>().add(CurrencyChanged(currency.code)),
                                            );
                                          },
                                        ),
                                      ProgramType.returning => BuildReturnFields(
                                          returnNumberFocus: _returnNumberFocus,
                                          stampNumberController: _returnNumberController,
                                          holes: _returns,
                                          selectedNumbers: (state.program as ReturnEntity).winningNumbers,
                                          remove: () => _addRemoveReturnsNumber(-1),
                                          add: () => _addRemoveReturnsNumber(1),
                                          toggleReturnNumber: (number) => _toggleWinningStamps(number),
                                        ),
                                      ProgramType.unknown => Placeholder(),
                                    },
                                    FidesTextInputSelection<TimeUnit>(
                                      focusNode: _lastingNumberFocus,
                                      controller: _lastingNumberController,
                                      inputLabel: 'How long should the program last*',
                                      helperText: 'How long will the program be active',
                                      prefix: Text('${state.program.lastingPeriod.label} '),
                                      textInputType: TextInputType.number,
                                      inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                      validator: composeValidators<String>([requiredField]),
                                      dropDownList: TimeUnit.values.where((unit) => unit != TimeUnit.unknown).toList(),
                                      selectedValue: state.program.lastingPeriod,
                                      onChangedDropdown: (TimeUnit? value) => context.read<SetupProgramBloc>().add(LastingDateChanged(lastingPeriod: value)),
                                      onFieldSubmitted: (_) => _lastingNumberFocus.unfocus(),
                                      itemBuilder: (unit) => Text(unit.label),
                                    ),
                                    FidesTextInput(
                                      focusNode: _noteFocus,
                                      controller: _noteController,
                                      inputLabel: 'Add a note',
                                      maxLines: 4,
                                      textInputAction: TextInputAction.send,
                                    ),
                                  ],
                                ),
                                AddRewardSection(
                                  programType: state.programType,
                                  rewards: state.program.rewards,
                                  winningNumbers: state.programType == ProgramType.spend ? null : (state.program as ReturnEntity).winningNumbers
                                    ?..sort(),
                                  isReturnNumberSelected: (number) => (state.selectReturnNumber ?? -1) == number,
                                  selectReturnNumber: state.selectReturnNumber,
                                  onSelectedWinningNumber: (number) => context.read<SetupProgramBloc>().add(SelectedReturnRewardChanged(number)),
                                  onDeleteReward: (reward) => context.read<SetupProgramBloc>().add(DeleteReward(reward)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AppButton.dual(
                        loading: state.loading,
                        onPrimaryPressed: _isButtonActive(state) ? () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SetupProgramBloc>().add(SubmitLoyaltyProgram());
                          }
                        } : null,
                        onSecondaryPressed: () => context.pop(),
                        primaryText: 'Create program',
                        icon: AppIcon.arrowRight(),
                        onSecondaryIcon: AppIcon.cancel(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Placeholder();
        }
      },
    );
  }
}
