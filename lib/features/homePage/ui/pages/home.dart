import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../loyaltyProgram/ui/bloc/loyaltyProgramBloc.dart';
import '../bloc/homeBloc.dart';
import '../widgets/latestCustomersSection.dart';
import '../widgets/loyalCustomersSection.dart';
import '../widgets/loyaltyProgramSection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu), title: Text('Home')),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      LoyalCustomersSection(),
                      SizedBox(height: 24),
                      if (state.programStatus == ProgramStatus.loading) ...{
                        CircularProgressIndicator(),
                      } else if (state.programStatus == ProgramStatus.error) ...{
                        Text(state.message!),
                      } else ...{
                        LoyaltyProgramSection(loyaltyPrograms: state.listOfPrograms!),
                      },
                      SizedBox(height: 24),
                      LatestCustomersSection(),
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
