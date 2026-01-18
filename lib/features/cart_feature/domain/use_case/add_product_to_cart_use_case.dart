import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/cart_repository.dart';

class AddProductToCartParams {
  final String productId;
  final int? quantity;

  AddProductToCartParams({required this.productId, this.quantity});

  Map<String, dynamic> get toMap {
    return {'productId': productId, 'qty': quantity};
  }
}

class AddProductToCartUseCase {
  final CartRepository addToCartRepo;

  AddProductToCartUseCase({required this.addToCartRepo});
  Future<Either<Failure, CartEntity>> call(AddProductToCartParams params) {
    return addToCartRepo.addToCart(params);
  }
}
