import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository removeFromCartRepo;

  RemoveFromCartUseCase({required this.removeFromCartRepo});
  Future<Either<Failure, CartEntity>> call(String cartId) async {
    return await removeFromCartRepo.removeFromCart(cartId);
  }
}
