import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/request_feature/data/data_source/request_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/entity/request_entity.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/repository/request_repository.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/use_cases/send_request_use_case.dart';

class RequestRepositoryImplement implements RequestRepository {
  final RequestRemoteDataSource requestRemoteDataSource;

  RequestRepositoryImplement({required this.requestRemoteDataSource});
  @override
  Future<Either<Failure, RequestEntity>> sendRequest(
    RequestParams params,
  ) async {
    try {
      final product = await requestRemoteDataSource.sendRequest(params);
      return Right(product);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
