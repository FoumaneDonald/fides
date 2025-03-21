import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_page/ui/pages/home_page.dart';

class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
    ],
    errorBuilder: (context, state) => Placeholder(),
  );
}