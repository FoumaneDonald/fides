import 'package:fides/features/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection.dart';
import '../../../../services/helpers/app_route_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../../services/helpers/reward_type_enum.dart';
import '../../../core/mixins/validation_mixins.dart';
import '../../../core/utilities/dismiss_keyboard.dart';
import '../../../core/widgets/fides_snack_bar.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/number_in_square.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stampNumberController = TextEditingController();
  final TextEditingController _pointValueController = TextEditingController();
  List<int> _holes = [];
  int initialStampNumber = 0;

  @override
  void initState() {
    final state = context.read<LoyaltyProgramBloc>().state;

    /* Assign value and biding bloc event to respective input */
    _nameController.text = state.loyaltyProgramEntity!.name ?? '';
    _nameController.addListener(() => context.read<LoyaltyProgramBloc>().add(NameChanged(_nameController.text)));

    if (state.loyaltyProgramEntity!.type == ProgramType.points) {
      _pointValueController.text = state.loyaltyProgramEntity!.pointValue ?? '';
      _pointValueController.addListener(() => context.read<LoyaltyProgramBloc>().add(PointValueChanged(_pointValueController.text)));
    } else if (state.loyaltyProgramEntity!.type == ProgramType.stamp) {
      _stampNumberController.text = state.loyaltyProgramEntity!.numberHoles?.toString() ?? initialStampNumber.toString();
      _createHoles(state.loyaltyProgramEntity!.numberHoles ?? initialStampNumber);
      _stampNumberController.addListener(() {
        final valueInt = int.parse(_stampNumberController.text.trim());
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: valueInt, deletedNumber: valueInt+1));
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _pointValueFocus.dispose();
    _stampNumberFocus.dispose();
    _nameController.dispose();
    _pointValueController.dispose();
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
    return DismissKeyboard(
      child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
        listener: (context, state) {
          final route = ModalRoute.of(context);
          final isCurrentRoute = route?.isCurrent ?? false;

          if (_stampNumberController.text.trim() != state.loyaltyProgramEntity!.numberHoles.toString()) {
            _stampNumberController.text = state.loyaltyProgramEntity!.numberHoles.toString();
            _createHoles(state.loyaltyProgramEntity!.numberHoles ?? initialStampNumber);
          }

          if( state.status == Status.error ){
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
              title: Text('Set up your ${state.loyaltyProgramEntity!.type?.label.toLowerCase() ?? ''} program'),
            ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fields with ( * ) are required'),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInputs(
                                  context: context,
                                  programType: state.loyaltyProgramEntity!.type,
                                  nameFocus: _nameFocus,
                                  pointValueFocus: _pointValueFocus,
                                  stampNumberFocus: _stampNumberFocus,
                                  nameController: _nameController,
                                  pointValueController: _pointValueController,
                                  stampNumberController: _stampNumberController,
                                  holes: _holes,
                                  selectedNumbers: state.loyaltyProgramEntity!.winningNumbers ?? [],
                                  validator: generalValidation,
                                  remove: () => _updateHoles(context, -1),
                                  add: () => _updateHoles(context, 1),
                                  onTap: (number) => _toggleSelection(context, number),
                                ),
                                SizedBox(height: 40),
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
                                      programType: state.loyaltyProgramEntity!.type!,
                                      onDelete: () => context.read<LoyaltyProgramBloc>().add(DeleteReward(reward)),
                                    );
                                  }).toList(),
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
                            if( state.loyaltyProgramEntity!.type == ProgramType.stamp && (state.loyaltyProgramEntity!.winningNumbers != null && state.loyaltyProgramEntity!.winningNumbers!.isNotEmpty)){
                              context.read<LoyaltyProgramBloc>().add(SubmitLoyaltyProgram());
                            }else{
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
      ),
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
        FidesTextInput(
          focusNode: pointValueFocus,
          controller: pointValueController,
          inputLabel: 'Value of a point*',
          hintText: '10',
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: validator,
          autoValidateMode: AutovalidateMode.onUnfocus,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
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
