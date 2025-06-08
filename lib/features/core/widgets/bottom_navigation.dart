import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/home_location.dart';
import '../../../config/routes/program_location.dart';
import '../../../services/helpers/app_route_enum.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  BottomNavigationBarWidgetState createState() => BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  int _calculateSelectedIndex(BuildContext context) {
    if (_beamerDelegate.currentBeamLocation is HomeLocation) {
      return 0;
    }
    if (_beamerDelegate.currentBeamLocation is ProgramLocation) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        _beamerDelegate.beamToNamed(AppRoute.home.path);
        break;
      case 1:
        _beamerDelegate.beamToNamed(AppRoute.programs.path);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = _beamerDelegate.currentBeamLocation is HomeLocation ? 0 : 1;
    return BottomNavigationBar(
      currentIndex: _calculateSelectedIndex(context),
      items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.book)),
        BottomNavigationBarItem(label: 'Programs', icon: Icon(Icons.article)),
      ],
      onTap: (int index) => _onItemTapped(index, context),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
