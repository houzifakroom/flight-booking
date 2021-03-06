import 'package:flutter/foundation.dart';

abstract class OrError<V, E> {
  OrError._();

  factory OrError.value(V value) => _Value<V, E>._(value);
  factory OrError.error(E error) => _Error<V, E>._(error);

  _Error<V, E> get _asError => this as _Error<V, E>;
  _Value<V, E> get _asValue => this as _Value<V, E>;

  bool get isError;
  bool get isValue;

  R incase<R>({
    @required R Function(V v) value,
    @required R Function(E e) error,
  }) {
    return this.isValue
        ? value(this._asValue._value)
        : error(this._asError._error);
  }

  Stream<R> asyncIncase<R>({
    Stream<R> Function(V v) value,
    Stream<R> Function(E e) error,
  }) {
    return this.isValue
        ? value?.call(this._asValue._value) ?? Stream.empty()
        : error?.call(this._asError._error) ?? Stream.empty();
  }
}

class _Value<V, E> extends OrError<V, E> {
  _Value._(this._value) : super._();

  final V _value;

  @override
  bool get isError => false;

  @override
  bool get isValue => true;
}

class _Error<V, E> extends OrError<V, E> {
  _Error._(this._error) : super._();

  final E _error;

  @override
  bool get isError => true;

  @override
  bool get isValue => false;
}
