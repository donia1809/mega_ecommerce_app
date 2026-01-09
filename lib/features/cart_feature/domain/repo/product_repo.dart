import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_pagination_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/get_product_use_case.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductsPaginationEntity>> getProducts(
    ProductParams params,
  );
  Future<Either<Failure, ProductsEntity>> getProductById(String id);
}
