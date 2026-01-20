import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/update_quantity_use_case.dart';

abstract class CartRepository 
{
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> addToCart(AddProductToCartParams params);
  Future<Either<Failure, CartEntity>> removeFromCart(String productId);
  Future<Either<Failure, CartEntity>> incrementQuantity(String productId);
  Future<Either<Failure, CartEntity>> decrementQuantity(String productId);
  Future<Either<Failure, CartEntity>> updateQuantity(UpdateQuantityParams params);
}
