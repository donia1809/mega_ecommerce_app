abstract class AppException implements Exception {
  final String message;

  AppException({required this.message});
}

class OfflineException implements AppException {
  @override
  String get message => "you are offline, check your connection";
}

class NetworkException implements AppException {
  @override
  String get message => "Network error, Please check your connection";
}

class ServerException implements AppException {
  @override
  final String message;
  ServerException({required this.message});
}

class UnAuthorizedException implements AppException {
  @override
  String get message => "Un Aouthorized, login again";
}

class EmptyCacheException implements AppException {
  @override
  String get message => "No Data Found";
}

class CacheException implements AppException {
  @override
  String get message => "Something wrong while caching data";
}

class UnexpectedException implements AppException {
  @override
  String get message => "Some thing went wrong, Please try again";
}

class UnHandledException implements AppException {

  @override
  final String message;
  UnHandledException({required this.message});
}

class PermissionDeniedException implements AppException {

  @override
  final String message;
  PermissionDeniedException({required this.message});
}
class ResourceNotFoundException implements AppException {

  @override
  final String message;
  ResourceNotFoundException({required this.message});
}
