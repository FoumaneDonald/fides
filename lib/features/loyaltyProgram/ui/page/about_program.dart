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
import '../../../core/utilities/dismiss_keyboard.dart';
import '../../../core/widgets/fides_snack_bar.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/number_in_square.dart';
import '../../../core/widgets/required_field_text.dart';
import '../../../core/widgets/reward_card.dart';
import '../bloc/loyalty_program_bloc.dart';

class AboutProgram extends StatefulWidget {
  const AboutProgram({super.key});

  @override
  State<AboutProgram> createState() => _AboutProgramState();
}

class _AboutProgramState extends State<AboutProgram> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _pointValueFocus = FocusNode();
  final FocusNode _stampNumberFocus = FocusNode();
  final FocusNode _minimumPurchaseFocus = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stampNumberController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _minimumSpentController = TextEditingController();
  List<int> _holes = [];
  int initialStampNumber = 0;
  PointsEntity? statePointsEntity;
  StampEntity? stateStampEntity;

  @override
  void initState() {
    super.initState();
    final state = context.read<LoyaltyProgramBloc>().state;

    /* Assign value and biding bloc event to respective input */
    _nameController.text = state.loyaltyProgramEntity!.name ?? '';
    _nameController.addListener(() => context.read<LoyaltyProgramBloc>().add(NameChanged(_nameController.text)));

    if (state.selectedProgramType == ProgramType.stamp && state.loyaltyProgramEntity is StampEntity) {
      stateStampEntity = state.loyaltyProgramEntity! as StampEntity;

      _stampNumberController.text = stateStampEntity!.numberHoles?.toString() ?? initialStampNumber.toString();

      _createHoles(stateStampEntity!.numberHoles ?? initialStampNumber);

      _stampNumberController.addListener(() {
        final valueInt = int.parse(_stampNumberController.text.trim());
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: valueInt, deletedNumber: valueInt + 1));
      });
    } else if (state.selectedProgramType == ProgramType.points) {
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
    _pointValueFocus.dispose();
    _stampNumberFocus.dispose();
    _nameController.dispose();
    _pointsController.dispose();
    _stampNumberController.dispose();
    super.dispose();
  }

  _updateHoles(BuildContext context, int change) {
    final currentNumber = int.parse(_stampNumberController.text);
    final updatedNumber = currentNumber + change;

    // Ensure it's not negative
    if (updatedNumber >= 0) {
      if (change < 0) {
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: updatedNumber, deletedNumber: currentNumber));
      } else {
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: updatedNumber));
      }
    }
  }

  _createHoles(int number) {
    _holes = List.generate(number, (index) => 1 + index);
  }

  _toggleSelection(BuildContext context, int number) {
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
          _createHoles(stateStampEntity!.numberHoles ?? initialStampNumber);
        }

        if (state.status == Status.error) {
          showSnackBar(context, state.message!);
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
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFieldText(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            spacing: 40,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // _buildInputs(
                              //   context: context,
                              //   programType: state.loyaltyProgramEntity!.type,
                              //   nameFocus: _nameFocus,
                              //   pointValueFocus: _pointValueFocus,
                              //   stampNumberFocus: _stampNumberFocus,
                              //   nameController: _nameController,
                              //   pointValueController: _pointValueController,
                              //   stampNumberController: _stampNumberController,
                              //   holes: _holes,
                              //   selectedNumbers: state.loyaltyProgramEntity!.winningNumbers ?? [],
                              //   validator: generalValidation,
                              //   remove: () => _updateHoles(context, -1),
                              //   add: () => _updateHoles(context, 1),
                              //   onTap: (number) => _toggleSelection(context, number),
                              // ),
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
                                    validator: generalValidation,
                                    autoValidateMode: AutovalidateMode.onUnfocus,
                                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(state.selectedProgramType! == ProgramType.stamp ? _stampNumberFocus : _pointValueFocus),
                                  ),
                                  if (state.selectedProgramType == ProgramType.points) ...{
                                    FidesTextInput(
                                      focusNode: _pointValueFocus,
                                      controller: _pointsController,
                                      inputLabel: 'Points Earned*',
                                      hintText: '10',
                                      helper: Text('How many points a customers receive.'),
                                      textInputType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      inputFormatter: [
                                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                                      ],
                                      validator: generalValidation,
                                      autoValidateMode: AutovalidateMode.onUnfocus,
                                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                    ),
                                    FidesTextInput(
                                      focusNode: _minimumPurchaseFocus,
                                      controller: _minimumSpentController,
                                      inputLabel: 'For Every Amount Spent*',
                                      hintText: '500',
                                      helper: Text('The spending required to earn the points above.'),
                                      textInputType: TextInputType.number,
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(statePointsEntity!.currencyCode ?? 'XAF'),
                                          IconButton(
                                            onPressed: () {
                                              showCurrencyPicker(
                                                context: context,
                                                favorite: ['XAF'],
                                                onSelect: (Currency currency) => context.read<LoyaltyProgramBloc>().add(CurrencyChanged(currency.code)),
                                              );
                                            },
                                            icon: Icon(Icons.arrow_drop_down_rounded),
                                          ),
                                        ],
                                      ),
                                      textInputAction: TextInputAction.next,
                                      validator: generalValidation,
                                      autoValidateMode: AutovalidateMode.onUnfocus,
                                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                    ),
                                  },
                                  if (state.selectedProgramType == ProgramType.stamp) ...{
                                    FidesTextInput(
                                      focusNode: _stampNumberFocus,
                                      controller: _stampNumberController,
                                      inputLabel: 'Number of stamps needed*',
                                      hintText: '0',
                                      textAlign: TextAlign.center,
                                      textInputType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                      prefixIcon: IconButton(
                                        onPressed: () => _updateHoles(context, -1),
                                        icon: Icon(Icons.remove),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () => _updateHoles(context, 1),
                                        icon: Icon(Icons.add),
                                      ),
                                      validator: generalValidation,
                                      autoValidateMode: AutovalidateMode.onUnfocus,
                                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                    ),
                                    Column(
                                      spacing: 4,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Choose stamp numbers that unlock a reward*',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        if (_holes.isEmpty) ...{
                                          Text('Try adding one by tapping on the + button'),
                                        } else ...{
                                          Wrap(
                                            spacing: 10,
                                            runSpacing: 12,
                                            children: _holes.map(
                                              (number) {
                                                final bool isSelected = stateStampEntity!.winningNumbers?.contains(number) ?? false;
                                                return NumberInSquare(
                                                  isSelected: isSelected,
                                                  number: number,
                                                  onTap: (number) => _toggleSelection(context, number),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        },
                                      ],
                                    ),
                                  },
                                ],
                              ),
                              Column(
                                spacing: 16,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Set your rewards'),
                                  TextButton(
                                    onPressed: () => context.pushNamed(AppRoute.programReward.name),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text('Add Reward'), SizedBox(width: 8), Icon(Icons.add_rounded)],
                                    ),
                                  ),
                                  Column(
                                    spacing: 8,
                                    children: state.rewardEntityList!.map((reward) {
                                      return RewardCard(
                                        reward: reward,
                                        programType: state.selectedProgramType!,
                                        onDelete: () => context.read<LoyaltyProgramBloc>().add(DeleteReward(reward)),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    PrimaryButton(
                      loading: state.status == Status.loading,
                      text: 'Create program',
                      onPressed: () async {
                        if (_formKey.currentState!.validate() && state.rewardEntityList!.isNotEmpty) {
                          if (state.selectedProgramType! == ProgramType.stamp && (stateStampEntity!.winningNumbers != null && stateStampEntity!.winningNumbers!.isNotEmpty)) {
                            context.read<LoyaltyProgramBloc>().add(SubmitLoyaltyProgram());
                          } else {
                            context.read<LoyaltyProgramBloc>().add(SubmitLoyaltyProgram());
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildInputs({
  required ProgramType? programType,
  required BuildContext context,
  required FocusNode nameFocus,
  required FocusNode pointValueFocus,
  required FocusNode stampNumberFocus,
  required TextEditingController nameController,
  required TextEditingController stampNumberController,
  required TextEditingController pointValueController,
  required List holes,
  required List<int> selectedNumbers,
  required String? Function(String?)? validator,
  required Function()? remove,
  required Function()? add,
  required Function(int) onTap,
}) {
  return Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FidesTextInput(
        focusNode: nameFocus,
        controller: nameController,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
        inputLabel: 'Name*',
        hintText: 'Book worm',
        validator: validator,
        autoValidateMode: AutovalidateMode.onUnfocus,
        onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(programType == ProgramType.stamp ? stampNumberFocus : pointValueFocus),
      ),
      if (programType == ProgramType.points)
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: FidesTextInput(
                focusNode: pointValueFocus,
                controller: pointValueController,
                inputLabel: 'Points Earned*',
                hintText: '10',
                helper: Text('How many points a customers receive.'),
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: validator,
                autoValidateMode: AutovalidateMode.onUnfocus,
                onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
            Expanded(
              child: FidesTextInput(
                focusNode: pointValueFocus,
                controller: pointValueController,
                inputLabel: 'For Every Amount Spent',
                hintText: '500',
                helper: Text('The spending required to earn the points above.'),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Currency'),
                    IconButton(
                      onPressed: () {
                        showCurrencyPicker(
                          context: context,
                          favorite: ['XAF'],
                          onSelect: (Currency currency) => context.read<LoyaltyProgramBloc>().add(CurrencyChanged(currency.name)),
                        );
                      },
                      icon: Icon(Icons.arrow_drop_down_rounded),
                    ),
                  ],
                ),
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: validator,
                autoValidateMode: AutovalidateMode.onUnfocus,
                onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
          ],
        ),
      if (programType == ProgramType.stamp) ...{
        FidesTextInput(
          focusNode: stampNumberFocus,
          controller: stampNumberController,
          inputLabel: 'Number of stamps needed*',
          hintText: '0',
          textAlign: TextAlign.center,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
          prefixIcon: IconButton(
            onPressed: remove,
            icon: Icon(Icons.remove),
          ),
          suffixIcon: IconButton(
            onPressed: add,
            icon: Icon(Icons.add),
          ),
          validator: validator,
          autoValidateMode: AutovalidateMode.onUnfocus,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose stamp numbers that unlock a reward*',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (holes.isEmpty) ...{
              Text('Try adding one by tapping on the + button'),
            } else ...{
              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: holes.map(
                  (number) {
                    final isSelected = selectedNumbers.contains(number);
                    return NumberInSquare(
                      isSelected: isSelected,
                      number: number,
                      onTap: onTap,
                    );
                  },
                ).toList(),
              ),
            },
          ],
        ),
      },
    ],
  );
}
