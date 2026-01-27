import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/repository/owner_repository.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class DeleteProductUseCase {
  final OwnerRepository ownerRepo;

  DeleteProductUseCase({required this.ownerRepo});
  Future<Either<Failure, ProductEntity>> call(String productId) async {
    return await ownerRepo.deleteProduct(productId);
  }
}
