import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../features/homePage/ui/pages/home.dart';
import '../../services/helpers/app_route_enum.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [AppRoute.home.path];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey(AppRoute.home.name),
        title: AppRoute.programReward.name.toUpperCase(),
        child: HomePage(),
      ),
    ];
  }
}
