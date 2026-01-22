import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/entity/request_entity.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/repository/request_repository.dart';

class RequestParams {
  final String message;

  const RequestParams({required this.message});
  Map<String, dynamic> get toMap {
    return {'message': message};
  }
}

class SendRequestUseCase {
  final RequestRepository requestRepo;

  const SendRequestUseCase({required this.requestRepo});

  Future<Either<Failure, RequestEntity>> call(RequestParams params) {
    return requestRepo.sendRequest(params);
  }
}
