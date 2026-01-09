import 'package:mega_ecommerce_app/core/network/exeptions/exceptions.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class FailuresHandler {
  final AppException exception;

  FailuresHandler({required this.exception});

  Failure get map {
    final exception = this.exception;
    switch (exception) {
      case OfflineException():
        return OfflineFailure(message: exception.message);
      case NetworkException():
        return OfflineFailure(message: exception.message);

      case ServerException():
        return ServerFailure(message: exception.message);

      case UnAuthorizedException():
        return UnAuthorizedFailure(message: exception.message);

      case EmptyCacheException():
        return EmptyCacheFailure(message: exception.message);

      case CacheException():
        return CacheFailure(message: exception.message);

      case PermissionDeniedException():
        return PermissionDeniedFailure(message: exception.message);
      
      case ResourceNotFoundException():
        return ResourceNotFoundFailure(message: exception.message);

      case UnexpectedException():
      case UnHandledException():
      default:
        return UnexpectedFailure(message: exception.message);
    }
  }
}
