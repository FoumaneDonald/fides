import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'config/theme/buttonTheme.dart';
import 'config/theme/colorScheme.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // TextTheme textTheme = createTextTheme(context, "Livvic", "Livvic");
    // MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      title: 'fides',
      // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      theme: ThemeData(
        fontFamily: 'Livvic',
        filledButtonTheme: filledButtonThemeData,
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFFAAA2)),
        colorScheme: lightScheme(),
      ),
      routerConfig: Routes.router,
    );
  }
}