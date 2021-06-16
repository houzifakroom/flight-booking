import 'package:flight_booking/network/response.dart';
import 'package:flight_booking/ui/home_page/dtos/Flight_Inspiration_Search.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://test.api.amadeus.com/v1')
abstract class Api {
  factory Api(Dio dio) = _Api;

  @FormUrlEncoded()
  @POST('/security/oauth2/token')
  Future<void> getToken(
    @Body() String grant_type,
    @Body() String client_id,
    @Body() String client_secret,
  );

  // ***************************
  @GET('/shopping/flight-destinations')
  Future<DataResponse<List<FlightInspirationSearch>>>
      getFlightInspirationSearch(
    @Query('origin') String origin,
  );
}
