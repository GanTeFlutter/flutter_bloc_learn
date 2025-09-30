import 'package:flutter_bloc_example/product/service/services/logger_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  _registerSingletons();
  // _registerLazySingletons();
  // _registerFactories();
}

void _registerSingletons() {
  locator.registerSingleton<LoggerService>(LoggerService());
}

//void _registerLazySingletons() {}
// void _registerFactories() {}

extension ServiceLocator on GetIt {
  LoggerService get logger => locator<LoggerService>();
}


/// Kullanim
/// locator.logger.i("Uygulama başladı");
/// locator.supabase.addRandomUser();