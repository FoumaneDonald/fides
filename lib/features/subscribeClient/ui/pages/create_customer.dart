import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../injection.dart';
import '../../../core/widgets/fides_dropdown_input.dart';
import '../../../core/widgets/fides_multi_select_dropdown.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../homePage/ui/widgets/program_card.dart';
import '../bloc/customer_bloc.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({
    super.key,
  });

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  List<LoyaltyProgramEntity> selectedProgram = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => CustomerBloc(loyaltyProgramRepository: sl<LoyaltyProgramRepository>())..add(Init()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Subscribe a customer'),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_outlined)),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text('Subscribe a customer to a loyalty program'),
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
                                  inputLabel: 'Name*',
                                  hintText: 'Book worm',
                                  validator: generalValidation,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 16),
                                FidesTextInput(
                                  controller: _phoneController,
                                  inputLabel: 'Phone number',
                                  textInputType: TextInputType.number,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 16),
                                FidesTextInput(
                                  controller: _emailController,
                                  inputLabel: 'email',
                                  validator: emailValidation,
                                  textInputType: TextInputType.emailAddress,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 16),
                                FidesDropdownInput<LoyaltyProgramEntity>(
                                  inputLabel: 'Add to program*',
                                  dropDownList: state.programStatus == ProgramStatus.loading ? [LoyaltyProgramEntity(name: 'Loading...')] : state.loyaltyPrograms!,
                                  selectedValue: state.programStatus == ProgramStatus.loading ? LoyaltyProgramEntity(name: 'Loading...') : state.loyaltyPrograms![0],
                                  onChanged: (value) {
                                    if (value != null) {
                                      context.read<CustomerBloc>();
                                    }
                                  },
                                  itemBuilder: (LoyaltyProgramEntity loyaltyProgramEntity) {
                                    return Text(loyaltyProgramEntity.name!);
                                  },
                                ),
                                SizedBox(height: 16),
                                FidesMultiSelectBottomSheet<LoyaltyProgramEntity>(
                                  inputLabel: 'Add to program*',
                                  options: state.programStatus == ProgramStatus.loading ? [LoyaltyProgramEntity(name: 'Loading...')] : state.loyaltyPrograms!,
                                  selectedValues: state.selectedPrograms!,
                                  onSelectionChanged: (selected) {
                                    context.read<CustomerBloc>().add(SubscribeCustomer(programs: selected));
                                  },
                                  itemLabelBuilder: (program) {
                                    return Text(program.name!);  // This is for chips in the dropdown.
                                  },
                                  itemDisplayBuilder: (program) {
                                    final isSelected = state.selectedPrograms!.contains(program); // Track selection

                                    return ProgramCard(program: program,);
                                  },

                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      PrimaryButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // context.goNamed(AppRoute.programReward.name);
                          }
                        },
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
