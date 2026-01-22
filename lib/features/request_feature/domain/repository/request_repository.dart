import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/entity/request_entity.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/use_cases/send_request_use_case.dart';

abstract class RequestRepository 
{
  Future<Either<Failure, RequestEntity>> sendRequest(RequestParams params);
}
