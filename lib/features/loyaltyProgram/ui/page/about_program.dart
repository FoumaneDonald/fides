import 'dart:math';

import 'package:currency_picker/currency_picker.dart';
import 'package:fides/domain/entities/points_entity.dart';
import 'package:fides/features/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/stamp_entity.dart';
import '../../../../injection.dart';
import '../../../../services/helpers/app_route_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../../services/helpers/reward_type_enum.dart';
import '../../../core/mixins/validation_mixins.dart';
import '../../../core/utilities/app_icon.dart';
import '../../../core/utilities/dismiss_keyboard.dart';
import '../../../core/widgets/fides_snack_bar.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/stamp_number.dart';
import '../../../core/widgets/required_field_text.dart';
import '../../../core/widgets/reward_card.dart';
import '../bloc/loyalty_program_bloc.dart';
import '../widgets/build_points_inputs.dart';
import '../widgets/build_stamp_inputs.dart';

class AboutProgram extends StatefulWidget {
  const AboutProgram({super.key});

  @override
  State<AboutProgram> createState() => _AboutProgramState();
}

class _AboutProgramState extends State<AboutProgram> with ValidationMixins {
  // Form key and focus nodes
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _pointsFocus = FocusNode();
  final FocusNode _stampNumberFocus = FocusNode();
  final FocusNode _minimumPurchaseFocus = FocusNode();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stampNumberController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _minimumSpentController = TextEditingController();

  // Local state variables
  List<int> _holes = []; // Tracks number of stamps/holes
  int initialStampNumber = 0;
  PointsEntity? statePointsEntity;
  StampEntity? stateStampEntity;

  /// Initialize state and bind UI inputs with BLoC state
  @override
  void initState() {
    super.initState();
    final state = context.read<LoyaltyProgramBloc>().state;

    // Name field binding
    _nameController.text = state.loyaltyProgramEntity!.name ?? '';
    _nameController.addListener(() => context.read<LoyaltyProgramBloc>().add(NameChanged(_nameController.text)));

    // If current program is a stamp-based one
    if (state.selectedProgramType == ProgramType.stamp && state.loyaltyProgramEntity is StampEntity) {
      stateStampEntity = state.loyaltyProgramEntity! as StampEntity;
      _stampNumberController.text = stateStampEntity!.numberHoles.toString();
      // Generate holes/stamps
      _createHoles(stateStampEntity!.numberHoles);

      _stampNumberController.addListener(() {
        final valueInt = int.parse(_stampNumberController.text.trim());
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: valueInt, deletedNumber: valueInt + 1));
      });
    }
    // If current program is a points-based one
    else if (state.selectedProgramType == ProgramType.points) {
      statePointsEntity = state.loyaltyProgramEntity! as PointsEntity;

      _minimumSpentController.text = statePointsEntity!.minimumSpent?.toString() ?? '';

      _minimumSpentController.addListener(() {
        if (_minimumSpentController.text.isNotEmpty) {
          context.read<LoyaltyProgramBloc>().add(MinimumSpentChanged(double.parse(_minimumSpentController.text)));
        }
      });

      _pointsController.text = statePointsEntity!.points?.toString() ?? '';

      _pointsController.addListener(() {
        if (_pointsController.text.isNotEmpty) {
          context.read<LoyaltyProgramBloc>().add(PointsChanged(double.parse(_pointsController.text)));
        }
      });
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _pointsFocus.dispose();
    _stampNumberFocus.dispose();
    _nameController.dispose();
    _pointsController.dispose();
    _stampNumberController.dispose();
    super.dispose();
  }

  /// Adjust the number of stamp holes (+/-)
  _updateHoles(BuildContext context, int change) {
    final currentNumber = int.parse(_stampNumberController.text);
    final updatedNumber = currentNumber + change;

    // Prevent negative holes
    if (updatedNumber >= 0) {
      if (change < 0) {
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: updatedNumber, deletedNumber: currentNumber));
      } else {
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: updatedNumber));
      }
    }
  }

  /// Create list of stamp placeholders based on number
  _createHoles(int number) {
    _holes = List.generate(number, (index) => 1 + index);
  }

  /// Handle stamp selection toggle for rewards
  _toggleWinningStamps(BuildContext context, int number) {
    context.read<LoyaltyProgramBloc>().add(WinningStampChanged(number));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
      listener: (context, state) {
        final route = ModalRoute.of(context);
        final isCurrentRoute = route?.isCurrent ?? false;

        // If the controller value is different from the state's number of holes,
        // update the controller and regenerate the UI (e.g. stamp placeholders)
        if (_stampNumberController.text.trim() != (stateStampEntity?.numberHoles.toString() ?? '')) {
          _stampNumberController.text = stateStampEntity!.numberHoles.toString();
          _createHoles(stateStampEntity!.numberHoles);
        }

        if (state.status == Status.error) {
          MindLabSnackBar.error(context, state.message!);
        }

        if (state.status == Status.success && isCurrentRoute) {
          context.read<LoyaltyProgramBloc>().add(ResetForms());
          context.read<LoyaltyProgramBloc>().add(LoadLoyaltyPrograms());
          context.goNamed(AppRoute.programs.name);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_rounded)),
            title: Text('Set up your ${state.selectedProgramType?.label.toLowerCase() ?? ''} program'),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
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
                                spacing: 16,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FidesTextInput(
                                    focusNode: _nameFocus,
                                    controller: _nameController,
                                    textInputType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    inputLabel: 'Name*',
                                    hintText: 'Book worm',
                                    validator: requiredField,
                                    autoValidateMode: AutovalidateMode.onUnfocus,
                                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(state.selectedProgramType! == ProgramType.stamp ? _stampNumberFocus : _pointsFocus),
                                  ),
                                  switch (state.selectedProgramType) {
                                    ProgramType.points => BuildPointsInputs(
                                        currencyCode: (state.loyaltyProgramEntity as PointsEntity).currencyCode,
                                        pointsFocus: _pointsFocus,
                                        minimumPurchaseFocus: _minimumPurchaseFocus,
                                        pointsController: _pointsController,
                                        minimumSpentController: _minimumSpentController,
                                        validator: composeValidators<String>([requiredField]),
                                        onPressed: () {
                                          showCurrencyPicker(
                                            context: context,
                                            favorite: ['XAF'],
                                            onSelect: (Currency currency) => context.read<LoyaltyProgramBloc>().add(CurrencyChanged(currency.code)),
                                          );
                                        },
                                      ),
                                    ProgramType.stamp => BuildStampInputs(
                                        stampNumberFocus: _stampNumberFocus,
                                        stampNumberController: _stampNumberController,
                                        holes: _holes,
                                        selectedNumbers: (state.loyaltyProgramEntity as StampEntity).winningNumbers,
                                        validator: composeValidators<String>([requiredField]),
                                        remove: () => _updateHoles(context, -1),
                                        add: () => _updateHoles(context, 1),
                                        onTap: (number) => _toggleWinningStamps(context, number),
                                      ),
                                    ProgramType.unknown => Placeholder(),
                                    null => Placeholder(),
                                  },
                                ],
                              ),
                              Column(
                                spacing: 16,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rewards', style: Theme.of(context).textTheme.titleLarge),
                                  switch (state.selectedProgramType) {
                                    ProgramType.points => Column(
                                        children: [
                                          TextButton(
                                            onPressed: () => context.pushNamed(AppRoute.programReward.name),
                                            child: Row(
                                              spacing: 8,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.add_rounded),
                                                Text('Add Reward'),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            spacing: 8,
                                            children: state.loyaltyProgramEntity!.rewards.map((reward) {
                                              return RewardCard(
                                                reward: reward,
                                                programType: state.selectedProgramType!,
                                                onDelete: () => context.read<LoyaltyProgramBloc>().add(DeleteReward(reward)),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ProgramType.stamp => Builder(builder: (context) {
                                        final List<int> winningNumbers = (state.loyaltyProgramEntity as StampEntity).winningNumbers..sort();
                                        return Column(
                                          spacing: 4,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if ((state.loyaltyProgramEntity as StampEntity).winningNumbers.isNotEmpty) ...{
                                              Text('Select one to create its reward', style: Theme.of(context).textTheme.bodyMedium),
                                            },
                                            Row(
                                              spacing: 8,
                                              children: winningNumbers.map(
                                                (number) {
                                                  return ChoiceChip(
                                                    label: Row(
                                                      spacing: 8,
                                                      children: [
                                                        AppIcon.stamp(color: Theme.of(context).colorScheme.onSurfaceVariant, size: 18.0),
                                                        Text(
                                                          number.toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    selected: (state.stampReward ?? -1) == number,
                                                    onSelected: (bool value) => context.read<LoyaltyProgramBloc>().add(StampRewardChanged(number)),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                            if (state.stampReward != null) ...{
                                              TextButton(
                                                onPressed: () => context.pushNamed(AppRoute.programReward.name),
                                                child: Row(
                                                  spacing: 8,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.add_rounded),
                                                    Text('Add Reward for stamp ${state.stampReward!}'),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                spacing: 8,
                                                children: state.loyaltyProgramEntity!.rewards.where((reward) => reward.stampNumber == state.stampReward).map((reward) {
                                                  return RewardCard(
                                                    reward: reward,
                                                    programType: state.selectedProgramType!,
                                                    onDelete: () => context.read<LoyaltyProgramBloc>().add(DeleteReward(reward)),
                                                  );
                                                }).toList(),
                                              ),
                                            },
                                          ],
                                        );
                                      }),
                                    ProgramType.unknown => SizedBox.shrink(),
                                    null => SizedBox.shrink(),
                                  }
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16.0),
            child: PrimaryButton(
              loading: state.status == Status.loading,
              text: 'Create program',
              // For each winning number check that some reward matches it.
              isActive: switch (state.selectedProgramType) {
                ProgramType.stamp => (state.loyaltyProgramEntity as StampEntity).winningNumbers.every((number) => state.loyaltyProgramEntity!.rewards.any((reward) => reward.stampNumber == number)) &&
                    stateStampEntity!.winningNumbers.isNotEmpty,
                ProgramType.points => state.loyaltyProgramEntity!.rewards.isNotEmpty,
                ProgramType.unknown => false,
                null => false,
              },
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  context.read<LoyaltyProgramBloc>().add(SubmitLoyaltyProgram());
                }
              },
            ),
          ),
        );
      },
    );
  }
}
