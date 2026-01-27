import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/data/data_source/owner_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/repository/owner_repository.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/create_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/update_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class OwnerRepositoryImplement implements OwnerRepository {
  final OwnerRemoteDataSource ownerRemoteDataSource;

  OwnerRepositoryImplement({required this.ownerRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getOwnerProduct() async {
    try {
      final result = await ownerRemoteDataSource.getOwnerProduct();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateOwnerProduct(
    UpdateOwnerProductParams params,
  ) async {
    try {
      final result = await ownerRemoteDataSource.updateOwnerProduct(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> createProduct(
    CreateProductParams params,
  ) async {
    try {
      final result = await ownerRemoteDataSource.createProduct(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> deleteProduct(String productId) async {
    try {
      final result = await ownerRemoteDataSource.deleteProduct(productId);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
