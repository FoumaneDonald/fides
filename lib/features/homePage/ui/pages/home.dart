import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/latest_customers_section.dart';
import '../widgets/loyal_customers_section.dart';
import '../widgets/loyalty_program_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu), title: Text(AppLocalizations.of(context)!.home)),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        LoyalCustomersSection(),
                        SizedBox(height: 24),
                        LatestCustomersSection(),
                      ],
                    ),
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
