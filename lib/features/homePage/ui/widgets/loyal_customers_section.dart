import 'package:fides/features/core/widgets/fides_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
import '../../../core/utilities/app_icon.dart';

class LoyalCustomersSection extends StatelessWidget {
  const LoyalCustomersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('0'),
                  Text('Loyal customers'),
                ],
              ),
            ),
            Flexible(
              child: FilledButton(
                onPressed: () => context.pushNamed(AppRoute.subscribeCustomer.name),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Customer'),
                    AppIcon.addUser(color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
