import 'package:fides/features/core/widgets/fidesSnackBard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loader.dart';
import '../bloc/loyalty_program_bloc.dart';
import '../widgets/descriptionInput.dart';
import '../widgets/discountValueInput.dart';
import '../widgets/itemInput.dart';
import '../widgets/minimumPurchaseInput.dart';
import '../widgets/rewardCostInput.dart';
import '../widgets/typeOfRewardInput.dart';

class ProgramReward extends StatefulWidget {
  const ProgramReward({super.key});

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

  // selectRewardType(String? selectedValue) {
  //   if (selectedValue != null) {
  //     setState(() {
  //       selectedRewardType = selectedValue;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.goNamed('stampCardProgram'), icon: Icon(Icons.arrow_back_rounded)),
        title: Text('Program reward'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40),
            child: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
              listener: (context, state){
                if(state.status == Status.done){
                  context.goNamed('home');
                }
                if(state.status == Status.error){
                  showSnackBar(context, state.message ?? '');
                }
              },
              builder: (context, state) {
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
                                  inputOnChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(discountValue: int.parse(value.trim()), discountType: state.rewardEntity!.discountType)),
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
                              DescriptionInput(
                                controller: _descriptionController,
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(description: value.trim())),
                              ),
                              SizedBox(height: 16),
                              if(state.loyaltyProgramEntity!.type == 'Points')
                                RewardCostInput(
                                  controller: _pointCostController,
                                  onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(rewardCost: int.tryParse(value.trim()))),
                                ),
                              SizedBox(height: 16),
                              // MinPurchaseInput(
                              //   controller: _minPurchaseController,
                              //   onChanged: (value) => context.read<LoyaltyProgramBloc>().add(RewardChanges(minPurchase: int.tryParse(value.trim()))),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    state.status == Status.loading ? Loader() : FilledButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
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
