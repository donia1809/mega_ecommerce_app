import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class ResourceNotFoundFailure extends Failure {
  const ResourceNotFoundFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
