/// Base class for all exceptions thrown by the Readeck API client.
class ApiException implements Exception {
  /// A message describing the error.
  final String message;
  /// The HTTP status code, if available.
  final int? statusCode;
  /// The decoded response body, if available. Can be a Map, List, or String.
  final dynamic responseBody;

  ApiException(this.message, {this.statusCode, this.responseBody});

  @override
  String toString() {
    return 'ApiException: $message (Status Code: $statusCode)';
  }
}

/// Exception thrown when an API request results in a 401 Unauthorized error.
class UnauthorizedException extends ApiException {
  UnauthorizedException(String message, {dynamic responseBody})
      : super(message, statusCode: 401, responseBody: responseBody);
}

/// Exception thrown when an API request results in a 403 Forbidden error.
class ForbiddenException extends ApiException {
  ForbiddenException(String message, {dynamic responseBody})
      : super(message, statusCode: 403, responseBody: responseBody);
}

/// Exception thrown when an API request results in a 404 Not Found error.
class NotFoundException extends ApiException {
  NotFoundException(String message, {dynamic responseBody})
      : super(message, statusCode: 404, responseBody: responseBody);
}

/// Exception thrown when an API request results in a 422 Unprocessable Entity error,
/// typically indicating validation errors.
class ValidationException extends ApiException {
  /// A map containing structured validation errors, where keys are field names
  /// and values are lists of error messages for that field.
  final Map<String, List<String>>? errors;

  ValidationException(String message, {this.errors, dynamic responseBody})
      : super(message, statusCode: 422, responseBody: responseBody);

  @override
  String toString() {
    return 'ValidationException: $message (Status Code: $statusCode) Errors: $errors';
  }
}

/// Exception thrown when an API request results in a 5xx Internal Server Error.
class InternalServerErrorException extends ApiException {
  InternalServerErrorException(String message, {dynamic responseBody})
      : super(message, statusCode: 500, responseBody: responseBody); // Or a generic 5xx range
}
