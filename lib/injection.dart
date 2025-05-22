import 'package:fides/services/customer_dao.dart';
import 'package:fides/services/object_box.dart';
import 'package:fides/services/loyalty_program_dao.dart';
import 'package:fides/services/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'config/app_config.dart';
import 'data/repositories/customer_repo_impl.dart';
import 'data/repositories/local_loyalty_program_repo_impl.dart';
import 'domain/repositories/customer_repository.dart';
import 'domain/repositories/loyalty_program_repository.dart';
import 'features/homePage/ui/bloc/home_bloc.dart';
import 'features/loyaltyProgram/ui/bloc/loyalty_program_bloc.dart';
import 'features/subscribeClient/ui/bloc/customer_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initExternal();
  _initLoyaltyProgram();
  _initCustomer();
  _initHome();
}

Future<void> _initExternal() async {
  final appConfig = await AppConfig.load();
  sl.registerLazySingleton(() => appConfig);
  Bloc.observer = SimpleBlocObserver();
  final objectBox = await ObjectBox.create(sl<AppConfig>().localDatabaseName);
  sl.registerLazySingleton<ObjectBox>(() => objectBox);
}

_initHome() {
  sl.registerLazySingleton(() => HomeBloc(sl<CustomerRepository>()));
}

_initLoyaltyProgram() {
  sl.registerLazySingleton<LoyaltyProgramDao>(() => LoyaltyProgramDao(sl()));
  sl.registerLazySingleton<LoyaltyProgramRepository>(() => LocalLoyaltyProgramRepoImpl(sl()));
  sl.registerFactory<LoyaltyProgramBloc>(() => LoyaltyProgramBloc(loyaltyProgramRepository: sl()));
}

_initCustomer() {
  sl.registerLazySingleton<CustomerDao>(() => CustomerDao(sl()));
  sl.registerLazySingleton<CustomerRepository>(() => CustomerRepoImpl(sl<CustomerDao>()));
  sl.registerFactory(
    () => CustomerBloc(
      loyaltyProgramRepository: sl<LoyaltyProgramRepository>(),
      customerRepository: sl<CustomerRepository>(),
    ),
  );
}
