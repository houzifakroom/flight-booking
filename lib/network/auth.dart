import 'package:dio/dio.dart';
import 'package:flight_booking/utils/persistence_manager.dart';
import 'package:flight_booking/utils/service_locator.dart';

abstract class AuthDataDelegate {
  bool get isLoggedIn;
  String get accessToken;
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  final user = serviceLocator.get<UserStorage>();

  @override
  Future<dynamic> onRequest(Options options) async {
    if (user.accessToken != null) {
      options.headers['access_token'] = user.accessToken;
    }
    return options;
  }
}
