import 'package:json_annotation/json_annotation.dart';

class GenericConverter<T> implements JsonConverter<T, dynamic> {
  const GenericConverter();

  @override
  T fromJson(dynamic json) {
    final type = T.toString();
    if (json == null) return null;

    if (json is Map<String, dynamic>) {
      return _dtoFromJson(type, json);
    } else if (json is List) {
      return _listFromJson(type, json);
    } else if (json is int) {
      return json.toDouble() as T;
    } else {
      throw TypeError();
    }
  }

  T _listFromJson(String type, List<dynamic> json) {
    throw ClassNotProvidedForGenericConverterError(T);
  }

  T _dtoFromJson(String type, Map<String, dynamic> json) {
    throw ClassNotProvidedForGenericConverterError(T);
  }

  @override
  Map<String, dynamic> toJson(T object) {
    return object as Map<String, dynamic>;
  }
}

class ClassNotProvidedForGenericConverterError implements Exception {
  final Type type;

  ClassNotProvidedForGenericConverterError(this.type);

  @override
  String toString() {
    return 'Class Not Provided For Generic Converter: $type';
  }
}
