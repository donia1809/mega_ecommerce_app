import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/core/network/failures/failures_handler.dart';

class ExceptionsHandler {
  final Object object;

  ExceptionsHandler({required this.object});

  AppException get map {
    final exception = object;
    if (exception is AppException) {
      return exception;
    } else if (exception is DioException) {
      final statusCode = exception.response?.statusCode;

      final String? dioErrorMessage = exception.message;
      final String? apiMessage = exception.response?.data['message'];
      final String errorMessage = apiMessage ?? dioErrorMessage ?? '';
      switch (statusCode) {
        case 400:
        case 401:
        case 500:
          return ServerException(message: errorMessage);
        // return UnAuthorizedException();
        default:
          return UnexpectedException();
      }
    } else if (exception is Exception) {
      return UnHandledException(message: exception.toString());
    } else if (exception is String) {
      return UnHandledException(message: exception);
    } else if (exception is PlatformException) {
      switch (exception.code) {
        case 'PERMISSION_DENIED':
          return PermissionDeniedException(
            message: exception.message ?? 'Permission denied',
          );
        case 'NOT_FOUND':
          return ResourceNotFoundException(
            message: exception.message ?? 'Resource not found',
          );
        case 'NETWORK_ERROR':
          return NetworkException();
        default:
          return UnHandledException(
            message: exception.message ?? 'Unknown platform error',
          );
      }
    } else {
      return UnexpectedException();
    }
  }

  Failure get toFailure {
    final FailuresHandler failure = FailuresHandler(exception: map);
    return failure.map;
  }
}
