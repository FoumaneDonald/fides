import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../../domain/entities/reward_entity.dart';
import '../../../../services/helpers/discount_type_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../../services/helpers/reward_type_enum.dart';
import '../../../core/mixins/validation_mixins.dart';
import '../../../core/utilities/dismiss_keyboard.dart';
import '../../../core/widgets/fides_dropdown_input.dart';
import '../../../core/widgets/fides_snack_bar.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/fides_text_input_selection.dart';
import '../../../core/widgets/loader.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/required_field_text.dart';
import '../bloc/loyalty_program_bloc.dart';
import '../widgets/select_image_field.dart';

class CreateReward extends StatefulWidget {
  const CreateReward({super.key});

  @override
  State<CreateReward> createState() => _CreateRewardState();
}

class _CreateRewardState extends State<CreateReward> with ValidationMixins {
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
  final TextEditingController _winningStampController = TextEditingController();
  DiscountType selectedDiscountType = DiscountType.price;
  RewardType selectedRewardType = RewardType.free;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();

    for (var controller in [
      _discountAmountController,
      _itemController,
      _descriptionController,
      _pointCostController,
      _winningStampController,
    ]) {
      controller.addListener(() => setState(() {}));
    }

    final state = context.read<LoyaltyProgramBloc>().state;
    if (state is LoyaltyProgramEditing) {
      // In case of return program, display the select return winning number
      _winningStampController.text = state.selectReturnNumber?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    _discountAmountController.dispose();
    _itemController.dispose();
    _descriptionController.dispose();
    _pointCostController.dispose();
    _winningStampController.dispose();
    super.dispose();
  }

  bool _isButtonActive(LoyaltyProgramEditing state) {
    // Common checks
    final hasItem = _itemController.text.trim().isNotEmpty;
    final hasDescription = _descriptionController.text.trim().isNotEmpty;
    final hasImage = _selectedImage != null;

    bool isValid = hasItem && hasDescription && hasImage;

    // Check by program type and reward type
    if (state.programType == ProgramType.spend) {
      final hasPoints = _pointCostController.text.trim().isNotEmpty;
      isValid = isValid && hasPoints;
    }

    if (selectedRewardType == RewardType.discount) {
      final hasDiscount = _discountAmountController.text.trim().isNotEmpty;
      isValid = isValid && hasDiscount;
    }

    if (state.programType == ProgramType.returning) {
      final hasReturnNumber = _winningStampController.text.trim().isNotEmpty;
      isValid = isValid && hasReturnNumber;
    }

    return isValid;
  }

  Future<File> saveFileLocally(File pickedFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${p.basename(pickedFile.path)}';
    return await File(pickedFile.path).copy(path);
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close_rounded),
          ),
          title: Text('Program reward'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
                  listener: (context, state) {
                    if (state is LoyaltyProgramEditing) {
                      if (state.rewardStatus == RewardStatus.added) {
                        context.pop();
                      } else if (state.rewardStatus == RewardStatus.error) {
                        FidesSnackBar.error(context, state.message!);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is LoyaltyProgramEditing) {
                      return Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RequiredFieldText(),
                                if (state.programType == ProgramType.returning)
                                  FidesTextInput(
                                    controller: _winningStampController,
                                    enable: false,
                                    inputLabel: 'Return number*',
                                    validator: requiredField,
                                    onSaved: (value) => _winningStampController.text = value!.trim(),
                                  ),
                                FidesDropdownInput<RewardType>(
                                  focusNode: _rewardTypeFocus,
                                  inputLabel: 'Type of reward*',
                                  dropDownList: RewardType.values.where((type) => type != RewardType.unknown).toList(),
                                  selectedValue: selectedRewardType,
                                  validator: validateDropdown,
                                  onChanged: (value) => setState(() {
                                    selectedRewardType = value!;
                                  }),
                                  itemBuilder: (RewardType type) {
                                    return Text(type.label);
                                  },
                                ),
                                if (selectedRewardType == RewardType.discount) ...{
                                  FidesTextInputSelection(
                                    focusNode: _discountAmountFocus,
                                    controller: _discountAmountController,
                                    autoValidateMode: AutovalidateMode.onUserInteraction,
                                    inputLabel: 'Discount amount*',
                                    prefix: Text('${selectedDiscountType.label} '),
                                    textInputType: TextInputType.number,
                                    inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                    dropDownList: DiscountType.values.where((type) => type != DiscountType.unknown).toList(),
                                    selectedValue: selectedDiscountType,
                                    validator: validateDiscountAmount,
                                    textInputAction: TextInputAction.next,
                                    onChangedDropdown: (value) => setState(() {
                                      selectedDiscountType = value!;
                                    }),
                                    onSaved: (value) => _discountAmountController.text = value!.trim(),
                                    itemBuilder: (DiscountType type) => Text(type.label),
                                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_itemFocus),
                                  ),
                                },
                                FidesTextInput(
                                  focusNode: _itemFocus,
                                  controller: _itemController,
                                  inputLabel: '${selectedRewardType.label} Item*',
                                  validator: requiredField,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  onSaved: (value) => _itemController.text = value!.trim(),
                                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(state.programType == ProgramType.spend ? _pointsFocus : _descriptionFocus),
                                ),
                                SelectImageField(
                                  label: 'Item image*',
                                  validator: (image) => image == null ? 'Please select an image' : null,
                                  onSaved: (image) => _selectedImage = image,
                                  onChanged: (image) {
                                    setState(() {
                                      _selectedImage = image;
                                    });
                                  },
                                ),
                                if (state.programType == ProgramType.spend)
                                  FidesTextInput(
                                    focusNode: _pointsFocus,
                                    controller: _pointCostController,
                                    inputLabel: 'Points required to unlock reward*',
                                    validator: requiredField,
                                    inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    autoValidateMode: AutovalidateMode.onUserInteraction,
                                    onSaved: (value) => _pointCostController.text = value!.trim(),
                                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_descriptionFocus),
                                  ),
                                FidesTextInput(
                                  focusNode: _descriptionFocus,
                                  controller: _descriptionController,
                                  inputLabel: 'Reward description*',
                                  textInputType: TextInputType.name,
                                  maxLines: 6,
                                  validator: requiredField,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
                                  onSaved: (value) => _descriptionController.text = value!.trim(),
                                ),
                              ],
                            ),
                          ),
                          AppButton.primary(
                            loading: state.rewardStatus == RewardStatus.loading,
                            text: 'Add reward',
                            onPressed: _isButtonActive(state) ? () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final rewardEntity = RewardEntity(
                                  type: selectedRewardType,
                                  stampNumber: state.programType == ProgramType.returning ? int.tryParse(_winningStampController.text.trim()) : null,
                                  discountValue: selectedRewardType == RewardType.discount ? int.tryParse(_discountAmountController.text.trim()) : null,
                                  discountType: selectedRewardType == RewardType.discount ? selectedDiscountType : null,
                                  item: _itemController.text.trim(),
                                  imagePath: _selectedImage!.path,
                                  description: _descriptionController.text.trim(),
                                  rewardCost: state.programType == ProgramType.spend ? int.parse(_pointCostController.text.trim()) : null,
                                );

                                if (context.mounted) context.read<LoyaltyProgramBloc>().add(AddReward(rewardEntity));
                              }
                            } : null,
                          ),
                        ],
                      );
                    } else {
                      return Loader();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
