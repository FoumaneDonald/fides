import 'package:fides/features/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection.dart';
import '../../../../services/helpers/app_route_enum.dart';
import '../../../core/widgets/fides_text_input.dart';
import '../bloc/loyalty_program_bloc.dart';

class AboutPointsProgram extends StatefulWidget {
  const AboutPointsProgram({super.key});

  @override
  State<AboutPointsProgram> createState() => _AboutPointsProgramState();
}

class _AboutPointsProgramState extends State<AboutPointsProgram> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController _nameController;
  late TextEditingController _pointValue;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _pointValue = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_rounded)),
        title: Text('Stamp based program'),
      ),
      body: BlocBuilder<LoyaltyProgramBloc, LoyaltyProgramState>(
        builder: (context, state) {
          _nameController.text = state.loyaltyProgramEntity!.name ?? '';
          _pointValue.text = state.loyaltyProgramEntity!.pointValue ?? '';
          return SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About points-based program'),
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
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(AboutPointProgramChanged(name: value)),
                              ),
                              SizedBox(height: 16),
                              FidesTextInput(
                                controller: _pointValue,
                                inputLabel: 'Value of a point*',
                                hintText: '500',
                                suffixText: 'FCFA',
                                textInputType: TextInputType.number,
                                onChanged: (value) => context.read<LoyaltyProgramBloc>().add(AboutPointProgramChanged(pointValue: value)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PrimaryButton(
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                          context.goNamed(AppRoute.programReward.name, extra: {'source': AppRoute.pointsProgram.name});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
