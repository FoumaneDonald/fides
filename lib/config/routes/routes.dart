import 'package:fides/features/loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/core/widgets/ScaffoldWithNestedNavigation.dart';
import '../../features/homePage/ui/pages/home.dart';
import '../../features/loyaltyProgram/ui/page/programReward.dart';
import '../../features/loyaltyProgram/ui/page/selectLoyaltyProgram.dart';
import '../../features/loyaltyProgram/ui/page/stampCard/aboutStampCard.dart';
import '../../injection.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

class Routes {
  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // This builder returns the "shell" - the Scaffold with the BottomNavigationBar
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                name: 'loyaltyProgram',
                path: '/loyalty-program',
                builder: (context, state) => BlocProvider(
                  create: (context) => sl<LoyaltyProgramBloc>(),
                  child: const SelectLoyaltyProgram(),
                ),
                routes: [
                  GoRoute(
                    name: 'stampCardProgram',
                    path: 'stamp-card-program',
                    builder: (context, state) => BlocProvider.value(
                      value: sl<LoyaltyProgramBloc>(),
                      child: const AboutStampCard(),
                    ),
                  ),
                  GoRoute(
                    name: 'programReward',
                    path: 'program-reward',
                    builder: (context, state) => BlocProvider.value(
                      value: sl<LoyaltyProgramBloc>(),
                      child: const ProgramReward(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Placeholder(),
  );
}
