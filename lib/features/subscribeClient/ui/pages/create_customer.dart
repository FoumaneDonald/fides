import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:fides/features/core/utilities/dismiss_keyboard.dart';
import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../domain/entities/customer_entity.dart';
import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../domain/repositories/loyalty_program_repository.dart';
import '../../../../injection.dart';
import '../../../core/widgets/fides_dropdown_input.dart';
import '../../../core/widgets/fides_multi_select_dropdown.dart';
import '../../../core/widgets/fides_phone_input.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/required_field_text.dart';
import '../../../homePage/ui/bloc/home_bloc.dart';
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
  final PhoneController _phoneController = PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.CM, nsn: ''));
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _programsFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => sl<CustomerBloc>()..add(Init()),
      child: BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state.status == CustomerStatus.success) {
            MindLabSnackBar.success(context, state.message!);
            context.read<HomeBloc>().add(LatestCustomer());
            context.pop();
          } else if (state.status == CustomerStatus.error) {
            MindLabSnackBar.error(context, state.message!);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                  child: Column(
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
                                  focusNode: _nameFocusNode,
                                  inputLabel: 'Name*',
                                  textInputAction: TextInputAction.next,
                                  autoValidateMode: AutovalidateMode.onUnfocus,
                                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_phoneFocusNode),
                                  validator: composeValidators<String>([requiredField]),
                                  onChanged: (value) {
                                    setState(() {
                                      _nameController.text = value ?? '';
                                    });
                                  },
                                  onSaved: (value) {
                                    _nameController.text = value ?? '';
                                  },
                                ),
                                FidesPhoneInput(
                                  controller: _phoneController,
                                  focusNode: _phoneFocusNode,
                                  inputLabel: 'Phone number',
                                  textInputType: TextInputType.number,
                                  autoValidateMode: AutovalidateMode.onUnfocus,
                                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocusNode),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                  textInputAction: TextInputAction.next,
                                  validator: PhoneValidator.compose([
                                    PhoneValidator.validMobile(context),
                                    PhoneValidator.validType(context, PhoneNumberType.mobile),
                                    PhoneValidator.validCountry(context, IsoCode.values),
                                  ]),
                                  onSaved: (phone) {
                                    _phoneController.value = phone ?? const PhoneNumber(isoCode: IsoCode.CM, nsn: '');
                                  },
                                ),
                                FidesTextInput(
                                  controller: _emailController,
                                  focusNode: _emailFocusNode,
                                  inputLabel: 'Email',
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_programsFocusNode),
                                  autoValidateMode: AutovalidateMode.onUnfocus,
                                  validator: composeValidators<String>([emailValidation]),
                                  textInputType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    _emailController.text = value ?? '';
                                  },
                                ),
                                FormField<LoyaltyProgramEntity>(
                                  validator: composeValidators<LoyaltyProgramEntity>([validateDropdown]),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  builder: (FormFieldState<dynamic> field) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        FidesMultiSelectBottomSheet<LoyaltyProgramEntity>(
                                          focusNode: _programsFocusNode,
                                          inputLabel: 'Add to program*',
                                          options: state.programStatus == ProgramStatus.loading ? [] : state.listOfPrograms!,
                                          selectedValues: state.customerEntity!.loyaltyPrograms ?? [],
                                          errorText: field.errorText,
                                          hasError: field.hasError,
                                          onSelectionChanged: (selected) {
                                            field.didChange(selected.isEmpty ? null : selected.first);
                                            context.read<CustomerBloc>().add(OnSelectProgram(selected));
                                            _programsFocusNode.unfocus();
                                          },
                                          itemChipsLabelBuilder: (program) {
                                            return Text(program.name!); // This is for chips in the dropdown.
                                          },
                                          itemDisplayBuilder: (program, [isSelected = false, onTap]) {
                                            return SelectableProgramCard(program: program, isSelected: isSelected, onTap: onTap);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Add Customer',
                icon: Icons.add_rounded,
                isActive: _nameController.text.isNotEmpty && (state.customerEntity?.loyaltyPrograms?.isNotEmpty ?? false),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newCustomer = CustomerEntity(
                      name: _nameController.text.trim(),
                      phone: _phoneController.value.nsn.isNotEmpty ? _phoneController.value.international + _phoneController.value.nsn : null,
                      email: _emailController.text.trim(),
                      loyaltyPrograms: state.customerEntity!.loyaltyPrograms!,
                    );

                    context.read<CustomerBloc>().add(SubscribeCustomer(newCustomer));
                    // context.goNamed(AppRoute.programReward.name);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectableProgramCard extends StatelessWidget {
  final LoyaltyProgramEntity program;
  final bool isSelected;
  final VoidCallback? onTap;

  const SelectableProgramCard({super.key, required this.program, this.isSelected = false, required this.onTap});

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
