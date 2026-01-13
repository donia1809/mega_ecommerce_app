import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/favorites_repo.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class GetFavoriteProductsUseCase {
  final FavoritesRepo getFavoriteRepo;

  GetFavoriteProductsUseCase({required this.getFavoriteRepo});
  Future<Either<Failure, List<ProductEntity>>> call() {
    return getFavoriteRepo.getFavorite();
  }
}
