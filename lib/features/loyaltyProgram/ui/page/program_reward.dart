import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:fides/services/helpers/reward_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection.dart';
import '../../../../services/helpers/app_route_enum.dart';
import '../../../../services/helpers/discount_type_enum.dart';
import '../../../../services/helpers/program_type_enum.dart';
import '../../../core/widgets/fides_dropdown_input.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/loader.dart';
import '../../../homePage/ui/bloc/home_bloc.dart';
import '../bloc/loyalty_program_bloc.dart';
import '../widgets/discount_value_input.dart';
import '../widgets/item_input.dart';
import '../widgets/reward_cost_input.dart';
import '../widgets/type_of_reward_input.dart';

class ProgramReward extends StatefulWidget {
  final String? source;

  const ProgramReward({super.key, this.source});

  @override
  State<ProgramReward> createState() => _ProgramRewardState();
}

class _ProgramRewardState extends State<ProgramReward> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController _discountValueController;
  late TextEditingController _itemController;
  late TextEditingController _descriptionController;
  late TextEditingController _pointCostController;
  late TextEditingController _minPurchaseController;
  List<RewardType> listTypeOfReward = RewardType.values;
  String discountType = 'FCFA';

  @override
  void initState() {
    super.initState();
    _discountValueController = TextEditingController();
    _itemController = TextEditingController();
    _descriptionController = TextEditingController();
    _pointCostController = TextEditingController();
    _minPurchaseController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (widget.source == AppRoute.stampCardProgram.name) {
              context.goNamed(AppRoute.stampCardProgram.name);
            } else if (widget.source == AppRoute.pointsProgram.name) {
              context.goNamed(AppRoute.pointsProgram.name);
            } else {
              context.pop();
            }
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text('Program reward'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40),
            child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
              listener: (context, state) {
                final route = ModalRoute.of(context);
                final isCurrentRoute = route?.isCurrent ?? false;

                if (state.status == Status.success && isCurrentRoute) {
                  context.read<LoyaltyProgramBloc>().add(ResetForms());
                  context.read<LoyaltyProgramBloc>().add(LoadLoyaltyPrograms());
                  context.goNamed(AppRoute.programs.name);
                }
                if (state.status == Status.error && isCurrentRoute) {
                  showSnackBar(context, state.message ?? '');
                }
              },
              builder: (context, state) {
                print("${state.rewardEntity!.discountType?.label} ?? ${DiscountType.price.label}");
                _itemController.text = state.rewardEntity!.item ?? '';
                _descriptionController.text = state.rewardEntity!.description ?? '';
                _pointCostController.text = state.rewardEntity!.rewardCost?.toString() ?? '';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What are you rewarding your customer with ?'),
                    SizedBox(height: 24),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              FidesDropdownInput<RewardType>(
                                inputLabel: 'Type of reward*',
                                dropDownList: listTypeOfReward,
                                selectedValue: state.rewardEntity!.type!,
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<LoyaltyProgramBloc>().add(RewardTypeChanged(value));
                                  }
                                },
                                itemBuilder: (RewardType type) {
                                  return Text(type.label);
                                },
                              ),
                              SizedBox(height: 16),
                              if (state.rewardEntity!.type! == RewardType.discount) ...{
                                FidesTextInput(
                                  controller: _discountValueController,
                                  inputLabel: 'Discount value*',
                                  hintText: '100',
                                  suffixText: state.rewardEntity!.discountType?.label ?? DiscountType.price.label,
                                  textInputType: TextInputType.number,
                                  inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                  onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardDiscountValueChanged(int.tryParse(value))),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: DiscountType.values
                                      .map(
                                        (type) => RadioMenuButton<DiscountType>(
                                          value: type,
                                          groupValue: state.rewardEntity!.discountType ?? DiscountType.price,
                                          onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardDiscountTypeChanged(value)),
                                          child: Text(type.label),
                                        ),
                                      )
                                      .toList(),
                                ),
                                SizedBox(height: 16),
                              },
                              FidesTextInput(
                                controller: _itemController,
                                inputLabel: '${state.rewardEntity!.type!.label} Item*',
                                hintText: 'Coffee',
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardItemChanged(value.trim())),
                              ),
                              SizedBox(height: 16),
                              FidesTextInput(
                                controller: _descriptionController,
                                inputLabel: 'Description*',
                                hintText: '1000 FCFA off your next purchase',
                                textInputType: TextInputType.name,
                                maxLine: 2,
                                onChanged: (description) => context.read<LoyaltyProgramBloc>().add(RewardDescriptionChanged(description.trim())),
                              ),
                              SizedBox(height: 16),
                              if (state.loyaltyProgramEntity!.type == ProgramType.points.label)
                                FidesTextInput(
                                  controller: _pointCostController,
                                  inputLabel: 'How many point does the rewards cost*',
                                  hintText: '100',
                                  inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
                                  textInputType: TextInputType.number,
                                  onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardCostChanged(int.tryParse(value.trim()))),
                                ),
                              // MinPurchaseInput(
                              //   controller: _minPurchaseController,
                              //   onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(minPurchase: int.tryParse(value.trim()))),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    state.status == Status.loading
                        ? Loader()
                        : FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoyaltyProgramBloc>().add(SubmitLoyaltyProgram());
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('Add reward'), Icon(Icons.keyboard_arrow_right_rounded)],
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildType({
    required List<String> listTypeReward,
    required String selectedValue,
    Function(String? newValue)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type of reward*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownButtonFormField(
          value: selectedValue,
          items: listTypeReward
              .map(
                (reward) => DropdownMenuItem(
                  value: reward,
                  child: Text(reward),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
