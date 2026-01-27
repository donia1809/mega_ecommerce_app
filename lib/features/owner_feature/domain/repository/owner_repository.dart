import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/create_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/update_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

abstract class OwnerRepository {
  Future<Either<Failure, List<ProductEntity>>> getOwnerProduct();
  Future<Either<Failure, ProductEntity>> updateOwnerProduct(
    UpdateOwnerProductParams params,
  );
  Future<Either<Failure, ProductEntity>> createProduct(
    CreateProductParams params,
  );
  Future<Either<Failure, ProductEntity>> deleteProduct(String productId);
}
