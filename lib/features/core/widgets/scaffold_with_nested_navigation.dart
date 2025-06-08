import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/helpers/app_route_enum.dart';
import '../utilities/app_icon.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoute.home.path)) {
      return 0;
    }
    if (location.startsWith(AppRoute.programs.path)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoute.home.name);
        break;
      case 1:
        context.goNamed(AppRoute.programs.name);
        break;
    }
  }

  // _goBranch(BuildContext context, int index) {
  //   const int programsTabIndex = 1;
  //   child.goBranch(
  //     index,
  //     // A common pattern when using bottom navigation bars is to support
  //     // navigating to the initial location when tapping the item that is
  //     // already active. This example demonstrates how to support this behavior,
  //     // using the initialLocation parameter of goBranch.
  //     initialLocation: index == programsTabIndex || index == child.currentIndex,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Builder(builder: (context) {
        final selectedIndex = _calculateSelectedIndex(context);
        final selectedColor = Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? Theme.of(context).colorScheme.primary;
        final unselectedColor = Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ?? Theme.of(context).colorScheme.onSurfaceVariant;

        return BottomNavigationBar(
          // currentIndex: child.currentIndex,
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int index) => _onItemTapped(index, context),
          items: [
            BottomNavigationBarItem(icon: AppIcon.home(color: selectedIndex == 0 ? selectedColor : unselectedColor), label: 'Home'),
            BottomNavigationBarItem(icon: AppIcon.program(color: selectedIndex == 1 ? selectedColor : unselectedColor), label: 'Programs'),
          ],
        );
      }),
    );
  }
}
