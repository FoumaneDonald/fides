import 'package:fides/features/loyaltyProgram/ui/bloc/loyaltyProgramBloc.dart';
import 'package:fides/features/loyaltyProgram/ui/page/aboutPointsProgram.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/LoyaltyProgramRepository.dart';
import '../../features/core/widgets/ScaffoldWithNestedNavigation.dart';
import '../../features/homePage/ui/bloc/homeBloc.dart';
import '../../features/homePage/ui/pages/home.dart';
import '../../features/loyaltyProgram/ui/page/programReward.dart';
import '../../features/loyaltyProgram/ui/page/selectLoyaltyProgram.dart';
import '../../features/loyaltyProgram/ui/page/aboutStampProgram.dart';
import '../../injection.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

class Routes {
  static final router = GoRouter(
    initialLocation: '/home',
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
            name: 'home',
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: 'loyaltyProgram',
            path: '/loyalty-program',
            builder: (context, state) => SelectLoyaltyProgram(),
            routes: [
              GoRoute(
                name: 'stampCardProgram',
                path: 'stamp-card-program',
                builder: (context, state) => AboutStampProgram(),
              ),
              GoRoute(
                name: 'pointsProgram',
                path: 'points-program',
                builder: (context, state) => AboutPointsProgram(),
              ),
              GoRoute(
                name: 'programReward',
                path: 'program-reward',
                builder: (context, state) => ProgramReward(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Placeholder(),
  );
}
