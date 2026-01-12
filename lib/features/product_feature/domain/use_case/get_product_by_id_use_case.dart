import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/repo/product_repo.dart';

class GetProductByIdUseCase {
  final ProductRepo productRepo;

  const GetProductByIdUseCase({required this.productRepo});

  Future<Either<Failure, ProductsEntity>> call(String id) {
    return productRepo.getProductById(id);
  }
}
