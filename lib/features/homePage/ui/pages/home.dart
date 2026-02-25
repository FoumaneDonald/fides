import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/app_route_enum.dart';
import '../../../core/utilities/app_icon.dart';
import '../../../core/widgets/fides_app_bar.dart';
import '../../../core/widgets/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FidesAppBar(
        leading: IconButton(onPressed: () {}, icon: AppIcon.menu()),
        title: 'Home',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text('Explore'),
                  Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        spacing: 16,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ActionChip(
                                avatar: AppIcon.star(),
                                label: Text('Discover'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/program_presentation.jpg',
                            ),
                          ),
                          Text('Create a program based on how you want to reward your customers, for coming back often or for how much they spend.'),
                          AppButton.primary(
                            onPressed: () => context.pushNamed(AppRoute.selectLoyaltyProgram.name),
                            text: 'Create a program',
                            icon: AppIcon.add(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
