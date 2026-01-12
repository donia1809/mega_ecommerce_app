import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/data_source/product_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_pagination_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/repo/product_repo.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, ProductsPaginationEntity>> getProducts(
    ProductParams params,
  ) async {
    try {
      final product = await productRemoteDataSource.getProducts(params);
      return Right(product);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, ProductsEntity>> getProductById(String id) async {
    try {
      final product = await productRemoteDataSource.getProductById(id);
      return Right(product);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
