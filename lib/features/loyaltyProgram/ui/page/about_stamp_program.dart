import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:fides/features/core/widgets/fides_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../bloc/loyalty_program_bloc.dart';

class AboutStampProgram extends StatefulWidget {
  const AboutStampProgram({super.key});

  @override
  State<AboutStampProgram> createState() => _AboutStampProgramState();
}

class _AboutStampProgramState extends State<AboutStampProgram> with ValidationMixins {
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
    _holes = [];
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
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: updatedNumber, deletedNumber: currentNumber));
      } else {
        context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: updatedNumber));
      }
    }
  }

  _onChanged(BuildContext context, String value) {
    if (value.isEmpty) {
      value = '0';
    }
    final valueInt = int.parse(value.trim());
    context.read<LoyaltyProgramBloc>().add(NumHolesChanged(numHoles: valueInt, deletedNumber: valueInt));
  }

  _toggleSelection(BuildContext context, int number) {
    context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(winningNumbers: number));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_rounded)),
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
                              FidesTextInput(
                                controller: _nameController,
                                inputLabel: 'Name',
                                hintText: 'Coffee club',
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(AboutStampProgramChanged(name: value)),
                              ),
                              SizedBox(height: 16),
                              _buildNumberHolesInput(
                                controller: _numberPunchHolesController,
                                onChanged: (value) => _onChanged(context, value),
                                onSaved: (value) => _numberPunchHolesController.text = value!,
                                remove: () => _updateHoles(context, -1),
                                add: () => _updateHoles(context, 1),
                              ),
                              SizedBox(height: 16),
                              _buildHoles(
                                holes: _holes,
                                selectedNumbers: state.loyaltyProgramEntity!.winningNumbers ?? [],
                                onTap: (number) => _toggleSelection(context, number),
                              ),
                              if (state.loyaltyProgramEntity!.winningNumbers?.isEmpty ?? [].isEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    'Select at least one number',
                                    style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.error),
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
                          context.pushNamed(AppRoute.programReward.name, extra: {'source': AppRoute.stampCardProgram.name});
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

  Widget _buildNumberHolesInput({
    required TextEditingController controller,
    required Function(String)? onChanged,
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
        const SizedBox(height: 4),
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
          onChanged: onChanged,
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
        const SizedBox(height: 4),
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
                    color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
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
