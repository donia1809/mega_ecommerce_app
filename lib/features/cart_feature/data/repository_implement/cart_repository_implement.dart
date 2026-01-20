import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/data/data_source/cart_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/cart_repository.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/update_quantity_use_case.dart';

class CartRepositoryImplement implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImplement({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final result = await cartRemoteDataSource.getCart();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> addToCart(
    AddProductToCartParams params,
  ) async {
    try {
      final result = await cartRemoteDataSource.addToCart(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> removeFromCart(String productId) async {
    try {
      final result = await cartRemoteDataSource.removeFromCart(productId);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> incrementQuantity(
    String productId,
  ) async {
    try {
      final result = await cartRemoteDataSource.incrementQuantity(productId);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> decrementQuantity(
    String productId,
  ) async {
    try {
      final result = await cartRemoteDataSource.decrementQuantity(productId);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateQuantity(UpdateQuantityParams params) 
    async {
    try {
      final result = await cartRemoteDataSource.updateQuantity(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
