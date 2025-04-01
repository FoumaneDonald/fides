

import 'package:fides/services/objectBox.dart';
import 'package:fides/services/loyaltyProgramDao.dart';
import 'package:fides/services/simpleBlocObserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/LoyaltyProgramRepository.dart';
import 'domain/repositories/localLoyaltyProgramRepoImpl.dart';
import 'features/loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initExternal();
  _initLoyaltyProgram();
}

Future<void> _initExternal() async {
  Bloc.observer = SimpleBlocObserver();
  final objectBox = await ObjectBox.create();
  sl.registerLazySingleton<ObjectBox>(() => objectBox);

}

_initLoyaltyProgram() {
  sl.registerLazySingleton<LoyaltyProgramDao>(() => LoyaltyProgramDao(sl()));
  sl.registerLazySingleton<LoyaltyProgramRepository>(() => LocalLoyaltyProgramRepoImpl(sl()));
  sl.registerLazySingleton<LoyaltyProgramBloc>(() => LoyaltyProgramBloc(loyaltyProgramRepository: sl()));
}

