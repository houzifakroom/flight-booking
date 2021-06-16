import 'package:flight_booking/josn/generic_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BasicResponse {
  BasicResponse(this.status, this.message);

  String status;
  String message;

  factory BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}

@JsonSerializable()
class DataResponse<T> extends BasicResponse {
  @GenericConverter()
  T data;

  DataResponse(String status, String message, this.data)
      : super(status, message);

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class PaginationResponse<T> {
  @GenericConverter()
  final List<T> result;

  PaginationResponse(this.result);

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}

class ResponseStatus {
  static const int SUCCESS = 200;
}
