import 'package:collection/collection.dart';

import 'universal_request_type.dart';
import 'universal_type.dart';

/// Universal template for containing information about Request
final class UniversalRequest {
  /// Constructor for [UniversalRequest]
  const UniversalRequest({
    required this.name,
    required this.requestType,
    required this.route,
    required this.returnType,
    required this.parameters,
    this.description,
    this.isMultiPart = false,
    this.isFormUrlEncoded = false,
    this.isDeprecated = false,
  });

  /// Request name
  final String name;

  /// Request description
  final String? description;

  /// HTTP type of request
  final HttpRequestType requestType;

  /// Request route
  final String route;

  /// Request return type
  final UniversalType? returnType;

  /// Request parameters
  final List<UniversalRequestType> parameters;

  /// Request type 'multipart/form-data'
  final bool isMultiPart;

  /// Request type 'application/x-www-form-urlencoded'
  final bool isFormUrlEncoded;

  /// Value indicating whether this request is deprecated
  final bool isDeprecated;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversalRequest &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          requestType == other.requestType &&
          route == other.route &&
          returnType == other.returnType &&
          const DeepCollectionEquality().equals(parameters, other.parameters) &&
          isMultiPart == other.isMultiPart &&
          isFormUrlEncoded == other.isFormUrlEncoded;

  @override
  int get hashCode =>
      name.hashCode ^
      requestType.hashCode ^
      route.hashCode ^
      returnType.hashCode ^
      parameters.hashCode ^
      isMultiPart.hashCode ^
      isFormUrlEncoded.hashCode;
}

/// Request type
enum HttpRequestType {
  /// {@nodoc}
  get,

  /// {@nodoc}
  post,

  /// {@nodoc}
  head,

  /// {@nodoc}
  put,

  /// {@nodoc}
  delete,

  /// {@nodoc}
  patch,

  /// {@nodoc}
  connect,

  /// {@nodoc}
  options,

  /// {@nodoc}
  trace;

  /// Constructor for [HttpRequestType]
  const HttpRequestType();

  /// Get type from string
  static HttpRequestType? fromString(String type) =>
      HttpRequestType.values.firstWhereOrNull((e) => e.name == type);
}
