import 'package:fides/services/objectBox.dart';
import 'package:fides/services/loyaltyProgramDao.dart';
import 'package:fides/services/simpleBlocObserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/LoyaltyProgramRepository.dart';
import 'domain/repositories/localLoyaltyProgramRepoImpl.dart';
import 'features/loyaltyProgram/ui/bloc/loyaltyProgramBloc.dart';
import 'features/homePage/ui/bloc/homeBloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  await _initExternal();
  _initLoyaltyProgram();
  _initHome();
}

Future<void> _initExternal() async {
  Bloc.observer = SimpleBlocObserver();
  final objectBox = await ObjectBox.create();
  sl.registerLazySingleton<ObjectBox>(() => objectBox);

}

_initHome() {
  // sl.registerLazySingleton<HomeBloc>(() => HomeBloc(loyaltyProgramRepository: sl()));
}

_initLoyaltyProgram() {
  sl.registerLazySingleton<LoyaltyProgramDao>(() => LoyaltyProgramDao(sl()));
  sl.registerLazySingleton<LoyaltyProgramRepository>(() => LocalLoyaltyProgramRepoImpl(sl()));
  sl.registerFactory<LoyaltyProgramBloc>(() => LoyaltyProgramBloc(loyaltyProgramRepository: sl()));
}


