import 'package:fides/services/customer_dao.dart';
import 'package:fides/config/object_box.dart';
import 'package:fides/services/loyalty_program_dao.dart';
import 'package:fides/services/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import 'config/app_config.dart';
import 'data/repositories/customer_repo_impl.dart';
import 'data/repositories/local_loyalty_program_repo_impl.dart';
import 'domain/repositories/customer_repository.dart';
import 'domain/repositories/loyalty_program_repository.dart';
import 'features/homePage/bloc/home_bloc.dart';
import 'features/loyaltyProgram/bloc/loyalty_program_bloc.dart';
import 'features/setup_program/bloc/setup_program_bloc.dart';
import 'features/subscribeClient/bloc/customer_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initExternal();
  _initLoyaltyProgram();
  _initSetupProgram();
  _initCustomer();
  _initHome();
}

Future<void> _initExternal() async {
  final appConfig = await AppConfig.load();
  sl.registerLazySingleton<AppConfig>(() => appConfig);

  final objectBox = await ObjectBox.create(sl<AppConfig>().localDatabaseName);

  Bloc.observer = SimpleBlocObserver();

  sl.registerFactory<Uuid>(() => Uuid());
  sl.registerLazySingleton<ObjectBox>(() => objectBox);
}

void _initHome() {
  sl.registerLazySingleton(() => HomeBloc(sl<CustomerRepository>()));
}

void _initLoyaltyProgram() {
  sl.registerLazySingleton<LoyaltyProgramDao>(() => LoyaltyProgramDao(sl()));
  sl.registerLazySingleton<LoyaltyProgramRepository>(() => LocalLoyaltyProgramRepoImpl(sl()));
  sl.registerFactory<LoyaltyProgramBloc>(() => LoyaltyProgramBloc(loyaltyProgramRepository: sl()));
}

void _initSetupProgram() {
  sl.registerFactory<SetupProgramBloc>(() => SetupProgramBloc(sl<LoyaltyProgramRepository>(), sl<Uuid>()));
}

void _initCustomer() {
  sl.registerLazySingleton<CustomerDao>(() => CustomerDao(sl()));
  sl.registerLazySingleton<CustomerRepository>(() => CustomerRepoImpl(sl<CustomerDao>()));
  sl.registerFactory(
    () => CustomerBloc(
      loyaltyProgramRepository: sl<LoyaltyProgramRepository>(),
      customerRepository: sl<CustomerRepository>(),
    ),
  );
}
