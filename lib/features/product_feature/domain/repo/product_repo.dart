import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_pagination_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductsPaginationEntity>> getProducts(
    ProductParams params,
  );
  Future<Either<Failure, ProductsEntity>> getProductById(String id);
}
