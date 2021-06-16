import 'package:dio/dio.dart';

import 'auth.dart';

class DioFactory {
  static Dio create(Interceptors interceptors) {
    final dio = Dio()..interceptors.addAll(interceptors);
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    return dio;
  }

  static Dio withDefaultInterceptors() {
    return create(getDefaultInterceptors());
  }

  static Interceptors getDefaultInterceptors() {
    return Interceptors()
      ..addAll([
        AuthInterceptor(),
        LogInterceptor(requestBody: true, responseBody: true),
      ]);
  }
}
