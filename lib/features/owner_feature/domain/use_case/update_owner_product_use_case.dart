import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/repository/owner_repository.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class UpdateOwnerProductParams {
  final String? id;
  final String name;
  final double price;
  final String description;
  final int countInStock;
  final String? image;

  UpdateOwnerProductParams({
     this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.countInStock,
    this.image,
  });

  Map<String, dynamic> get toMap {
    return {
      'id':id,
      'name': name,
      'price': price,
      'description': description,
      'countInStock': countInStock,
      'image': image,
    };
  }
}

class UpdateOwnerProductUseCase {
  final OwnerRepository ownerRepo;

  const UpdateOwnerProductUseCase({required this.ownerRepo});

  Future<Either<Failure, ProductEntity>> call(UpdateOwnerProductParams params) {
    return ownerRepo.updateOwnerProduct(params);
  }
}
