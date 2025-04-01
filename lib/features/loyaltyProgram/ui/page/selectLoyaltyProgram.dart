import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/loyalty_program_bloc.dart';
import '../widgets/loyaltyProgramCard.dart';

class SelectLoyaltyProgram extends StatelessWidget {
  const SelectLoyaltyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Loyalty program'),
        ),
        body: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
          listener: (context, state) {
            if(state.status == Status.ongoing && GoRouter.of(context).routeInformationProvider.value.uri.path == '/loyalty-program'){
              if(state.loyaltyProgramEntity!.type == 'Stamp') {
                context.goNamed('stampCardProgram');
              }else if(state.loyaltyProgramEntity!.type == 'Points'){
                ///TODO: Change the route to correct one
                context.goNamed('stampCardProgram');
              }
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select loyalty program'),
                          SizedBox(height: 24),
                          Column(
                            children: [
                              LoyaltyProgramCard(
                                programName: 'Stamp-based program',
                                programDescription: 'A classic loyalty program where customers earn a digital stamp for each qualifying purchase.',
                                programImage: '',
                                onPressed: () => context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram('Stamp')),
                              ),
                              SizedBox(height: 16),
                              LoyaltyProgramCard(
                                programName: 'Points-based program',
                                programDescription: 'A flexible loyalty program where customers earn points for every money spent.',
                                programImage: '',
                                onPressed: () => context.read<LoyaltyProgramBloc>().add(SelectedLoyaltyProgram('Points')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
