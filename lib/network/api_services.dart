import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _apiKey = "dwkoSWQMGgwhS01YZMNJyTpAcFGZlwER";
  static const _secretKey = "f5NDMTJ6a1foBmiw";

  static const _baseUrl = 'test.api.amadeus.com';

  static const _authUrl =
      'https://test.api.amadeus.com/v1/security/oauth2/token';

  String _accessToken;

  String get accessToken => _accessToken;

  Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse(_authUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body:
          'grant_type=client_credentials&client_id=$_apiKey&client_secret=$_secretKey',
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data['access_token'];
      //Todo save access token

      if (accessToken != null) {
        print('Token request successful: $accessToken');
        return accessToken;
      }
    }

    print(
      'Token request failed\n'
      'status code: ${response.statusCode}\n'
      'reason phrase: ${response.reasonPhrase}\n'
      'body: ${response.body}',
    );
    throw response;
  }

  Future<T> checkTokenValidation<T>(Future<T> Function() onChecked) async {
    try {
      _accessToken ??= await getAccessToken();
      return await onChecked();
    } on http.Response catch (response) {
      if (response.statusCode == 401) {
        debugPrint('token expired, requesting a new one');
        _accessToken = await getAccessToken();
        return await onChecked();
      }
      rethrow;
    }
  }

  Future<String> getRawDataFromEndpoint(
    String endpointPath,
    Map<String, dynamic> queryParams,
  ) async {
    final apiCallFunc = () async {
      final valueSafeMap = <String, String>{};
      queryParams.forEach((key, value) {
        if (value != null) {
          valueSafeMap[key] =
              value is List ? value.toString() : value.toString();
        }
      });
      queryParams = valueSafeMap;

      final uri = getUri(endpointPath, queryParams);
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      debugPrint(
        'Request ${uri.toString()} with token: $accessToken\n'
        'Response: ${response.statusCode}: ${response.reasonPhrase}',
      );

      if (response.statusCode == 200) {
        return response.body;
      }

      throw (response);
    };

    try {
      return checkTokenValidation(apiCallFunc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Uri getUri(String endpointPath, [Map<String, dynamic> queryParams]) {
    return Uri(
      scheme: 'https',
      host: _baseUrl,
      path: endpointPath,
      queryParameters: queryParams,
    );
  }
}
