// ignore_for_file: unused_element

import '../../generated/l10n.dart' show S;

enum _ServerStatusCode {
  unKnown(null),
  unAuthorized(401),
  forbidden(403),
  notFound(404),
  someResourcesAreDown(409),
  tooManyRequests(429),
  serverDown(500);

  const _ServerStatusCode(this.statusCode);

  final int? statusCode;

  factory _ServerStatusCode.fromNullableInt(int? nullableInt) =>
      switch (nullableInt) {
        500 => _ServerStatusCode.serverDown,
        429 => _ServerStatusCode.tooManyRequests,
        409 => _ServerStatusCode.someResourcesAreDown,
        404 => _ServerStatusCode.notFound,
        403 => _ServerStatusCode.forbidden,
        401 => _ServerStatusCode.unAuthorized,
        _ => _ServerStatusCode.unKnown,
      };
}

enum _ResponseStatusCode {
  unKnown(null),
  success("SUCCESS"),
  mismarAPIRequestFailed("MISMAR_API_REQUEST_FAILED"),
  someResourcesAreDown("SOME_RESOURCES_ARE_DOWN"),
  unAuthorized("UNAUTHORIZED");

  const _ResponseStatusCode(this.statusCode);

  final String? statusCode;

  factory _ResponseStatusCode.fromNullableString(String? nullableStr) =>
      switch (nullableStr) {
        "SUCCESS" || "OK" => _ResponseStatusCode.success,
        "UNAUTHORIZED" => _ResponseStatusCode.unAuthorized,
        "SOME_RESOURCES_ARE_DOWN" => _ResponseStatusCode.someResourcesAreDown,
        "MISMAR_API_REQUEST_FAILED" =>
          _ResponseStatusCode.mismarAPIRequestFailed,
        _ => _ResponseStatusCode.unKnown,
      };

  String? get message => switch (this) {
    _ResponseStatusCode.success => S.current.success,
    _ResponseStatusCode.mismarAPIRequestFailed ||
    _ResponseStatusCode.someResourcesAreDown => S.current.badRequestException,
    _ResponseStatusCode.unAuthorized => S.current.unAuthorized,
    _ResponseStatusCode.unKnown => null,
  };
}
