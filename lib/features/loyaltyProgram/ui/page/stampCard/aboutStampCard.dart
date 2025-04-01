import 'package:fides/features/core/mixins/ValidationMixins.dart';
import 'package:fides/features/core/widgets/fidesTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/loyalty_program_bloc.dart';

class AboutStampCard extends StatefulWidget {
  const AboutStampCard({super.key});

  @override
  State<AboutStampCard> createState() => _AboutStampCardState();
}

class _AboutStampCardState extends State<AboutStampCard> with ValidationMixins {
  late TextEditingController _nameController;
  late TextEditingController _numberPunchHolesController;
  late List<int> _holes;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final List<int> _selectedNumbers = [];

  // final bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberPunchHolesController = TextEditingController();
  }

  _createHoles(int number) {
    _holes = List.generate(number, (index) => 1 + index);
  }

  _updateHoles(BuildContext context, int change) {
    final currentNumber = int.parse(_numberPunchHolesController.text);
    final updatedNumber = currentNumber + change;

    // Ensure it's not negative
    if (updatedNumber >= 0) {
      if (change < 0) {
        context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(numHoles: updatedNumber, deletedNumber: currentNumber));
      } else {
        context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(numHoles: updatedNumber));
      }
    }
  }

  _onSubmitted(BuildContext context, String value) {
    if (value.isEmpty) {
      value = '0';
    }
    final valueInt = int.parse(value.trim());
    context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(numHoles: valueInt, deletedNumber: valueInt));
  }

  _toggleSelection(int number) {
    context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(winningNumbers: number));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.goNamed('loyaltyProgram'), icon: Icon(Icons.arrow_back_rounded)),
        title: Text('Stamp based program'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: BlocBuilder<LoyaltyProgramBloc, LoyaltyProgramState>(
              builder: (context, state) {
                if (state.loyaltyProgramEntity!.numberHoles != null) {
                  _numberPunchHolesController.text = state.loyaltyProgramEntity!.numberHoles.toString();
                  _createHoles(state.loyaltyProgramEntity!.numberHoles!);
                }
                _nameController.text = state.loyaltyProgramEntity!.name ?? '';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About stamp-based program'),
                    SizedBox(height: 24),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildNameInput(
                                controller: _nameController,
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(name: value)),
                              ),
                              SizedBox(height: 16),
                              _buildNumberHolesInput(
                                controller: _numberPunchHolesController,
                                onSubmitted: (value) => _onSubmitted(context, value),
                                onSaved: (value) => _numberPunchHolesController.text = value!,
                                remove: () => _updateHoles(context, -1),
                                add: () => _updateHoles(context, 1),
                              ),
                              SizedBox(height: 16),
                              _buildHoles(
                                holes: _holes,
                                selectedNumbers: state.loyaltyProgramEntity!.winningNumbers ?? [],
                                onTap: (number) => _toggleSelection(number),
                              ),
                              if (state.loyaltyProgramEntity!.winningNumbers!.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    'Select atleast one number',
                                    style: TextStyle(fontSize: 12, color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && state.loyaltyProgramEntity!.winningNumbers!.isNotEmpty) {
                          _formKey.currentState!.save();
                          // context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(name: _nameController.text.trim(), done: true));
                          context.goNamed('programReward');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Continue'), Icon(Icons.keyboard_arrow_right_rounded)],
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

  Widget _buildNameInput({
    required TextEditingController controller,
    Function(String? value)? onSaved,
    Function(String)? onChanged
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        FidesTextFormField(
          controller: controller,
          hintText: 'Coffee club reward',
          validator: generalValidation,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildNumberHolesInput({
    required TextEditingController controller,
    required Function(String) onSubmitted,
    required Function(String?)? onSaved,
    required Function() remove,
    required Function() add,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Number of holes',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        FidesTextFormField(
          controller: controller,
          textInputType: TextInputType.number,
          prefixIcon: IconButton(
            onPressed: remove,
            icon: Icon(Icons.remove),
          ),
          suffixIcon: IconButton(
            onPressed: add,
            icon: Icon(Icons.add),
          ),
          onFieldSubmitted: onSubmitted,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
          validator: generalValidation,
          onSaved: onSaved,
        ),
      ],
    );
  }

  Widget _buildHoles({
    required List<int> holes,
    required List<int> selectedNumbers,
    required Function(int) onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select which number wins a gift',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: holes.map(
            (number) {
              final isSelected = selectedNumbers.contains(number);
              return InkWell(
                onTap: () => onTap(number),
                child: Container(
                  width: 52,
                  height: 52,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xffFFAAA2) : Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: Color(0xffB8B8B8),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffB8B8B8),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
