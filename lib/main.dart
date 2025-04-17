import 'package:fides/config/theme/input_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_theme.dart';
import 'config/theme/button_theme.dart';
import 'config/theme/color_scheme.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';
import 'domain/repositories/loyalty_program_repository.dart';
import 'features/homePage/ui/bloc/home_bloc.dart';
import 'features/loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';
import 'injection.dart' as di;
import 'injection.dart';
import 'l10n/app_localizations.dart';

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
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => sl<LoyaltyProgramBloc>()..add(LoadLoyaltyPrograms()),
        ),
      ],
      child: MaterialApp.router(
        title: 'fides',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        // theme: ThemeData(
        //   fontFamily: 'Livvic',
        //   filledButtonTheme: filledButtonThemeData,
        //   inputDecorationTheme: InputTheme.inputDecorationLightTheme,
        //   dropdownMenuTheme: InputTheme.dropdownDecorationLightTheme,
        //   // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFFAAA2)),
        //   colorScheme: lightScheme(),
        // ),
        routerConfig: Routes.router,
      ),
    );
  }
}