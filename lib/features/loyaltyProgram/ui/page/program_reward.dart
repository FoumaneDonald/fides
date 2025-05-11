import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:fides/services/helpers/reward_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/reward_entity.dart';
import '../../../../services/helpers/discount_type_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../core/mixins/validation_mixins.dart';
import '../../../core/utilities/dismiss_keyboard.dart';
import '../../../core/widgets/fides_dropdown_input.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/fides_text_input_selection.dart';
import '../../../core/widgets/loader.dart';
import '../../../core/widgets/required_field_text.dart';
import '../bloc/loyalty_program_bloc.dart';

class ProgramReward extends StatefulWidget {
  final String? source;

  const ProgramReward({super.key, this.source});

  @override
  State<ProgramReward> createState() => _ProgramRewardState();
}

class _ProgramRewardState extends State<ProgramReward> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _rewardTypeFocus = FocusNode();
  final FocusNode _discountAmountFocus = FocusNode();
  final FocusNode _itemFocus = FocusNode();
  final FocusNode _pointsFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final TextEditingController _discountAmountController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pointCostController = TextEditingController();
  DiscountType selectedDiscountType = DiscountType.price;
  RewardType selectedRewardType = RewardType.free;

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close_rounded),
          ),
          title: Text('Program reward'),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40),
              child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
                listener: (context, state) {
                  if (state.rewardStatus == RewardStatus.added) {
                    context.pop();
                  } else if (state.rewardStatus == RewardStatus.error) {
                    showSnackBar(context, state.message!);
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RequiredFieldText(),
                      SizedBox(height: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                FidesDropdownInput<RewardType>(
                                  focusNode: _rewardTypeFocus,
                                  inputLabel: 'Type of reward*',
                                  dropDownList: RewardType.values,
                                  selectedValue: selectedRewardType,
                                  validator: validateDropdown,
                                  onChanged: (value) => setState(() {
                                    selectedRewardType = value!;
                                  }),
                                  itemBuilder: (RewardType type) {
                                    return Text(type.label);
                                  },
                                ),
                                SizedBox(height: 16),
                                if (selectedRewardType == RewardType.discount) ...{
                                  FidesTextInputSelection(
                                    focusNode: _discountAmountFocus,
                                    controller: _discountAmountController,
                                    autoValidateMode: AutovalidateMode.onUnfocus,
                                    inputLabel: 'Discount amount*',
                                    hintText: '100',
                                    prefixText: selectedDiscountType.label,
                                    textInputType: TextInputType.number,
                                    inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                    dropDownList: DiscountType.values,
                                    selectedValue: selectedDiscountType,
                                    validator: validateDiscountAmount,
                                    onChangedDropdown: (value) => setState(() {
                                      selectedDiscountType = value!;
                                    }),
                                    onSaved: (value) => _discountAmountController.text = value!.trim(),
                                    itemBuilder: (DiscountType type) => Text(type.label),
                                  ),
                                  SizedBox(height: 16),
                                },
                                FidesTextInput(
                                  focusNode: _itemFocus,
                                  controller: _itemController,
                                  inputLabel: '$selectedRewardType Item*',
                                  hintText: 'Coffee',
                                  validator: generalValidation,
                                  autoValidateMode: AutovalidateMode.onUnfocus,
                                  onSaved: (value) => _itemController.text = value!.trim(),
                                ),
                                SizedBox(height: 16),
                                if (state.loyaltyProgramEntity!.type == ProgramType.points)
                                  FidesTextInput(
                                    focusNode: _pointsFocus,
                                    controller: _pointCostController,
                                    inputLabel: 'Points required to unlock reward*',
                                    hintText: '100',
                                    validator: generalValidation,
                                    inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                    textInputType: TextInputType.number,
                                    autoValidateMode: AutovalidateMode.onUnfocus,
                                    onSaved: (value) => _pointCostController.text = value!.trim(),
                                  ),
                                SizedBox(height: 16),
                                FidesTextInput(
                                  focusNode: _descriptionFocus,
                                  controller: _descriptionController,
                                  inputLabel: 'Reward description*',
                                  hintText: 'Help your customers understand what this reward is for.',
                                  textInputType: TextInputType.name,
                                  maxLine: 6,
                                  validator: generalValidation,
                                  autoValidateMode: AutovalidateMode.onUnfocus,
                                  onSaved: (value) => _descriptionController.text = value!.trim(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      state.rewardStatus == RewardStatus.loading
                          ? Loader()
                          : FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  final rewardEntity = RewardEntity(
                                    type: selectedRewardType,
                                    discountValue: selectedRewardType == RewardType.discount ? int.tryParse(_discountAmountController.text.trim()) : null,
                                    discountType: selectedRewardType == RewardType.discount ? selectedDiscountType : null,
                                    item: _itemController.text.trim(),
                                    description: _descriptionController.text.trim(),
                                    rewardCost: state.loyaltyProgramEntity!.type == ProgramType.points ? int.parse(_pointCostController.text.trim()) : null,
                                  );

                                  context.read<LoyaltyProgramBloc>().add(AddReward(rewardEntity));
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text('Add reward'), Icon(Icons.add_rounded)],
                              ),
                            ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
