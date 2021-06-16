import 'package:flight_booking/network/api_services.dart';
import 'package:flight_booking/network/network_caller.dart';
import 'package:flight_booking/utils/bloc.dart';
import 'package:flight_booking/utils/persistence_manager.dart';
import 'package:flight_booking/utils/service_locator.dart';

/************************************* trip State */
abstract class TripStatus {}

class OnTripLoading extends TripStatus {}

class OnTripLoaded extends TripStatus {}

class OnTripError extends TripStatus {}

//************************************ Trip Event */
class TripEvent extends BlocEvent<TripStatus, TripBloc> {
  @override
  Stream<TripStatus> toState(TripStatus current, TripBloc bloc) async* {
    if (current is OnTripLoading) {
      yield OnTripLoading();
      final rec = await bloc.network.call((api) => api.getToken(
          'client_credentials',
          'dwkoSWQMGgwhS01YZMNJyTpAcFGZlwER',
          'f5NDMTJ6a1foBmiw'));
      rec.incase(
          value: (v) async* {
            bloc.storage.setAccessToken('access_token');
            yield OnTripLoaded();
          },
          error: (e) => OnTripError());
    }
  }
}

//*************************************Trip Bloc  */
class TripBloc extends BaseBloc<TripStatus> {
  final network = serviceLocator.get<NetworkCaller>();
  final storage = serviceLocator.get<UserStorage>();
}
