import 'package:fides/config/theme/inputTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';
import 'config/theme/buttonTheme.dart';
import 'config/theme/colorScheme.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';
import 'data/repositories/LoyaltyProgramRepository.dart';
import 'features/homePage/ui/bloc/homeBloc.dart';
import 'features/loyaltyProgram/ui/bloc/loyaltyProgramBloc.dart';
import 'injection.dart' as di;
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(loyaltyProgramRepository: sl<LoyaltyProgramRepository>())..add(InitialisingHome()),
        ),
        BlocProvider(
          create: (context) => sl<LoyaltyProgramBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'fides',
        // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        theme: ThemeData(
          fontFamily: 'Livvic',
          filledButtonTheme: filledButtonThemeData,
          inputDecorationTheme: InputTheme.inputDecorationLightTheme,
          dropdownMenuTheme: InputTheme.dropdownDecorationLightTheme,
          // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFFAAA2)),
          colorScheme: lightScheme(),
        ),
        routerConfig: Routes.router,
      ),
    );
  }
}