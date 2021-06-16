// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Api implements Api {
  _Api(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://test.api.amadeus.com/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<void> getToken(grant_type, client_id, client_secret) async {
    ArgumentError.checkNotNull(grant_type, 'grant_type');
    ArgumentError.checkNotNull(client_id, 'client_id');
    ArgumentError.checkNotNull(client_secret, 'client_secret');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = grant_type;
    await _dio.request<void>('/security/oauth2/token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<DataResponse<List<FlightInspirationSearch>>>
      getFlightInspirationSearch(origin) async {
    ArgumentError.checkNotNull(origin, 'origin');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'origin': origin};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/shopping/flight-destinations',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value =
        DataResponse<List<FlightInspirationSearch>>.fromJson(_result.data);
    return value;
  }
}
