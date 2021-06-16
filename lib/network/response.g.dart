// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) {
  return BasicResponse(
    json['status'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$BasicResponseToJson(BasicResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

DataResponse<T> _$DataResponseFromJson<T>(Map<String, dynamic> json) {
  return DataResponse<T>(
    json['status'] as String,
    json['message'] as String,
    GenericConverter<T>().fromJson(json['data']),
  );
}

Map<String, dynamic> _$DataResponseToJson<T>(DataResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': GenericConverter<T>().toJson(instance.data),
    };

PaginationResponse<T> _$PaginationResponseFromJson<T>(
    Map<String, dynamic> json) {
  return PaginationResponse<T>(
    (json['result'] as List)?.map(GenericConverter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$PaginationResponseToJson<T>(
        PaginationResponse<T> instance) =>
    <String, dynamic>{
      'result': instance.result?.map(GenericConverter<T>().toJson)?.toList(),
    };
