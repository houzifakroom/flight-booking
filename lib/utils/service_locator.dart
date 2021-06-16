import 'package:dio/dio.dart';
import 'package:flight_booking/network/api.dart';
import 'package:flight_booking/network/dio.dart';
import 'package:flight_booking/network/network_caller.dart';
import 'package:flight_booking/utils/persistence_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final serviceLocator = GetIt.instance;
void setupServiceLocator() {
  final persistenceManager = PersistenceManager()..init();
  serviceLocator.registerSingleton<PersistenceManager>(persistenceManager);
  serviceLocator.registerSingleton<SettingsStorage>(persistenceManager);
  serviceLocator.registerSingleton<UserStorage>(persistenceManager);
  serviceLocator.registerSingleton<AppStorage>(persistenceManager);
  serviceLocator.registerSingleton<Dio>(DioFactory.withDefaultInterceptors());
  serviceLocator.registerFactory<Api>(() => Api(serviceLocator.get<Dio>()));
  serviceLocator.registerSingleton<NetworkCaller>(
      NetworkCaller(serviceLocator.get<Api>()));
}
