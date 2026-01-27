import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/repository/owner_repository.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class CreateProductParams {
  final String name;
  final double price;
  final String description;
  final int countInStock;
  final String image;
  final String category;

  CreateProductParams({
    required this.name,
    required this.price,
    required this.description,
    required this.countInStock,
    required this.image,
    required this.category,

  });

  Map<String, dynamic> get toMap {
    return {
      'name': name,
      'price': price,
      'description': description,
      'countInStock': countInStock,
      'image': image,
      'category': category,
    };
  }
}

class CreateProductUseCase {
  final OwnerRepository ownerRepo;

  const CreateProductUseCase({required this.ownerRepo});

  Future<Either<Failure, ProductEntity>> call(CreateProductParams params) {
    return ownerRepo.createProduct(params);
  }
}
