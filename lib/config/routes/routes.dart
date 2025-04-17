import 'package:fides/features/loyaltyProgram/ui/page/about_points_program.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/core/widgets/scaffold_with_nested_navigation.dart';
import '../../features/homePage/ui/pages/home.dart';
import '../../features/loyaltyProgram/ui/page/about_stamp_program.dart';
import '../../features/loyaltyProgram/ui/page/program_reward.dart';
import '../../features/loyaltyProgram/ui/page/programs.dart';
import '../../features/loyaltyProgram/ui/page/select_loyalty_program.dart';
import '../../features/subscribeClient/ui/pages/create_customer.dart';
import '../../services/helpers/app_route_enum.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

class Routes {
  static final router = GoRouter(
    initialLocation: AppRoute.home.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          // This builder returns the "shell" - the Scaffold with the BottomNavigationBar
          return ScaffoldWithNestedNavigation(child: child);
        },
        routes: [
          GoRoute(
            name: AppRoute.home.name,
            path: AppRoute.home.path,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: AppRoute.programs.name,
            path: AppRoute.programs.path,
            builder: (context, state) => const Programs(),
            routes: [
              GoRoute(
                name: AppRoute.selectLoyaltyProgram.name,
                path: AppRoute.selectLoyaltyProgram.path,
                builder: (context, state) => SelectLoyaltyProgram(),
                routes: [
                  GoRoute(
                    name: AppRoute.stampCardProgram.name,
                    path: AppRoute.stampCardProgram.path,
                    builder: (context, state) => AboutStampProgram(),
                  ),
                  GoRoute(
                    name: AppRoute.pointsProgram.name,
                    path: AppRoute.pointsProgram.path,
                    builder: (context, state) => AboutPointsProgram(),
                  ),
                  GoRoute(
                    name: AppRoute.programReward.name,
                    path: AppRoute.programReward.path,
                    builder: (context, state) {
                      final extra = state.extra as Map<String, String>?;
                      return ProgramReward(source: extra?['source']);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: 'subscribeCustomer',
        path: '/subscribe_customer',
        builder: (context, state) => CreateCustomer(),
      )
    ],
    errorBuilder: (context, state) => Placeholder(),
  );
}
