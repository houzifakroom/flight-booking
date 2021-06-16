import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'Flight_Inspiration_Search.g.dart';

@JsonSerializable()
class FlightInspirationSearch {
  String type;
  String origin;
  String destination;
  String departureDate;
  String returnDate;
  Price price;
  Links links;

  FlightInspirationSearch(
      {this.type,
      this.origin,
      this.destination,
      this.departureDate,
      this.returnDate,
      this.price,
      this.links});

  factory FlightInspirationSearch.fromJson(Map<String, dynamic> json) =>
      _$FlightInspirationSearchFromJson(json);

  Map<String, dynamic> toJson() => _$FlightInspirationSearchToJson(this);
}

@JsonSerializable()
class Price {
  String total;

  Price({this.total});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Links {
  String flightDates;
  String flightOffers;

  Links({this.flightDates, this.flightOffers});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
