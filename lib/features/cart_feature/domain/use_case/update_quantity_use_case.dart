import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/cart_repository.dart';

class UpdateCartItemQuantityUseCase {
  final CartRepository updateQuantityRepo;

  UpdateCartItemQuantityUseCase({required this.updateQuantityRepo});
  Future<Either<Failure, CartEntity>> call(UpdateQuantityParams params) async {
    return await updateQuantityRepo.updateQuantity(params);
  }
}

class UpdateQuantityParams {
  final int quantity;
  final String productId;

  UpdateQuantityParams({required this.quantity, required this.productId});

  Map<String, dynamic> get toMap {
    return {
      'quantity':quantity,
    };
  }
}
