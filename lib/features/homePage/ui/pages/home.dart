import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/customer_entity.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/utilities/app_icon.dart';
import '../../../loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/latest_customers_section.dart';
import '../widgets/loyal_customers_section.dart';
import '../widgets/loyalty_program_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  leading: AppIcon.menu(color: Theme.of(context).colorScheme.onSurface),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(AppLocalizations.of(context)!.home),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: LoyalCustomersSection(),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Latest customers'),
                        Text('see all'),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Today'),
                  ),
                ),

                if (state.listOfCustomers?.isEmpty ?? true) ...{
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text('No customer'),
                    ),
                  )
                } else ...{
                  SliverList.separated(
                    itemCount: state.listOfCustomers!.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final CustomerEntity customer = state.listOfCustomers![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              spacing: 16,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: 32, width: 32, child: Placeholder()),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(customer.name),
                                      Text(customer.phone ?? ''),
                                      Text(customer.email ?? ''),
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_right_outlined),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                }
              ],
            ),
          );
        },
      ),
    );
  }
}
