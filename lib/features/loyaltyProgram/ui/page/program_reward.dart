import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection.dart';
import '../../../../services/helpers/app_route_enum.dart';
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
  List<String> listTypeOfReward = ['Free', 'Discount'];
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
            if( widget.source == AppRoute.stampCardProgram.name ) {
              context.goNamed(AppRoute.stampCardProgram.name);
            } else if ( widget.source == AppRoute.pointsProgram.name){
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
                _itemController.text = state.rewardEntity!.item ?? '';
                _descriptionController.text = state.rewardEntity!.description ?? '';
                _pointCostController.text = state.rewardEntity!.rewardCost.toString() ?? '';
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
                              TypeOfRewardInput(
                                listTypeReward: listTypeOfReward,
                                selectedValue: state.rewardEntity!.type!,
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<LoyaltyProgramBloc>().add(RewardChanges(type: value.trim()));
                                  }
                                },
                              ),
                              SizedBox(height: 16),
                              if (state.rewardEntity!.type! == 'Discount') ...{
                                DiscountValueInput(
                                  controller: _discountValueController,
                                  selectedDiscountType: state.rewardEntity!.discountType ?? 'FCFA',
                                  inputOnChanged: (value) =>
                                      context.read<LoyaltyProgramBloc>().add(RewardChanges(discountValue: int.parse(value.trim()), discountType: state.rewardEntity!.discountType)),
                                  onChanged: (value) {
                                    if (value != null) {
                                      context.read<LoyaltyProgramBloc>().add(RewardChanges(discountType: value.trim(), discountValue: state.rewardEntity!.discountValue));
                                    }
                                  },
                                ),
                                SizedBox(height: 16),
                              },
                              ItemInput(
                                controller: _itemController,
                                rewardType: state.rewardEntity!.type!,
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(item: value.trim())),
                              ),
                              SizedBox(height: 16),
                              FidesTextInput(
                                controller: _descriptionController,
                                inputLabel: 'Description*',
                                hintText: '1000 FCFA off your next purchase',
                                textInputType: TextInputType.name,
                                maxLine: 2,
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(description: value.trim())),
                              ),
                              SizedBox(height: 16),
                              if (state.loyaltyProgramEntity!.type == 'Points')
                                RewardCostInput(
                                  controller: _pointCostController,
                                  onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(rewardCost: int.tryParse(value.trim()))),
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
                    state.status == Status.loading
                        ? Loader()
                        : FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoyaltyProgramBloc>().add(RewardChanges(submit: true));
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
