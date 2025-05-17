import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:fides/features/core/utilities/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../injection.dart';
import '../../../core/widgets/fides_dropdown_input.dart';
import '../../../core/widgets/fides_multi_select_dropdown.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/required_field_text.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<LoyaltyProgramEntity> selectedProgram = [];

  @override
  void initState() {
    super.initState();
    // _nameController = ;
    // _phoneController = ;
    // _emailController = ;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => CustomerBloc(loyaltyProgramRepository: sl<LoyaltyProgramRepository>())..add(Init()),
      child: DismissKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add a Customer'),
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_outlined)),
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    return Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredFieldText(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                spacing: 16,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FidesTextInput(
                                    controller: _nameController,
                                    inputLabel: 'Name*',
                                    validator: generalValidation,
                                    onChanged: (value) {},
                                  ),
                                  FidesTextInput(
                                    controller: _phoneController,
                                    inputLabel: 'Phone number',
                                    textInputType: TextInputType.number,
                                    onChanged: (value) {},
                                  ),
                                  FidesTextInput(
                                    controller: _emailController,
                                    inputLabel: 'email',
                                    validator: emailValidation,
                                    textInputType: TextInputType.emailAddress,
                                    onChanged: (value) {},
                                  ),
                                  // FidesMultiSelectBottomSheet<LoyaltyProgramEntity>(
                                  //   inputLabel: 'Add to program*',
                                  //   options: state.programStatus == ProgramStatus.loading ? [LoyaltyProgramEntity(name: 'Loading...')] : state.loyaltyPrograms!,
                                  //   selectedValues: state.selectedPrograms!,
                                  //   onSelectionChanged: (selected) => context.read<CustomerBloc>().add(OnSelectProgram(selected)),
                                  //   itemChipsLabelBuilder: (program) {
                                  //     return Text(program.name!); // This is for chips in the dropdown.
                                  //   },
                                  //   itemDisplayBuilder: (program, [isSelected = false, onTap]) {
                                  //     return SelectableProgramCard(program: program, isSelected: isSelected, onTap: onTap);
                                  //   },
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                        PrimaryButton(
                          text: 'Add Customer',
                          icon: Icons.add_rounded,
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
      ),
    );
  }
}

class SelectableProgramCard extends StatelessWidget {
  final LoyaltyProgramEntity program;
  final bool isSelected;
  final VoidCallback? onTap;

  const SelectableProgramCard({
    super.key,
    required this.program,
    this.isSelected = false,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .12,
                          height: MediaQuery.of(context).size.height * .05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: SvgPicture.asset(
                              program.type!.iconPath,
                              semanticsLabel: 'Program icon',
                              // width: 24,
                              // height: 24,
                              colorFilter: ColorFilter.srgbToLinearGamma(),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              program.type!.label.toLowerCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Text(
                              program.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Checkbox(value: isSelected, onChanged: null)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
