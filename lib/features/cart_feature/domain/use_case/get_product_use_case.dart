import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_pagination_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/product_repo.dart';

class GetProductUseCase {
  final ProductRepo productRepo;

  const GetProductUseCase({required this.productRepo});
  Future<Either<Failure, ProductsPaginationEntity>> call(ProductParams params) {
    return productRepo.getProducts(params);
  }
}

class ProductParams {
  final int page;
  final String? keyword;
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final double? rating;

  ProductParams({
    this.page = 1,
    this.keyword,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.rating,
  });

  Map<String, dynamic> get toMap {
    return {
      'pageNumber': page,
      'keyword': keyword,
      'category': category,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'rating': rating,
    };
  }
}
