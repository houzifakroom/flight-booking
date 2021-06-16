// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Flight_Inspiration_Search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightInspirationSearch _$FlightInspirationSearchFromJson(
    Map<String, dynamic> json) {
  return FlightInspirationSearch(
    type: json['type'] as String,
    origin: json['origin'] as String,
    destination: json['destination'] as String,
    departureDate: json['departureDate'] as String,
    returnDate: json['returnDate'] as String,
    price: json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>),
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FlightInspirationSearchToJson(
        FlightInspirationSearch instance) =>
    <String, dynamic>{
      'type': instance.type,
      'origin': instance.origin,
      'destination': instance.destination,
      'departureDate': instance.departureDate,
      'returnDate': instance.returnDate,
      'price': instance.price,
      'links': instance.links,
    };

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
    total: json['total'] as String,
  );
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'total': instance.total,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    flightDates: json['flightDates'] as String,
    flightOffers: json['flightOffers'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'flightDates': instance.flightDates,
      'flightOffers': instance.flightOffers,
    };
