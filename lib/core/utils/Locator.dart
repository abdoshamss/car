import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../core/utils/validations.dart';
// import '../../features/auth/domain/repository/auth_repository.dart';
// import '../../features/splash/domain/repository/splash_repository.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/splash/domain/repository/splash_repository.dart';
import '../Router/Router.dart';
import '../config/key.dart';
import '../data_source/dio_helper.dart';
import '../data_source/hive_helper.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DataManager());
  locator.registerLazySingleton(() => DioService(ConstKeys.baseUrl));
    locator.registerLazySingleton(() => RoutesApp());
    locator.registerLazySingleton(() => Validation());
    // locator.registerLazySingleton(() => MyMedia());
    locator.registerLazySingleton(() => GlobalKey<ScaffoldState>());
  locator.registerLazySingleton(() => GlobalKey<NavigatorState>());
  locator.registerLazySingleton(() => AuthRepository(locator<DioService>()));
  locator.registerLazySingleton(() => SplashRepository(locator<DioService>()));

}
