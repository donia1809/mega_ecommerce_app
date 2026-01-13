import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/toggle_favorite_entity.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/favorites_repo.dart';

class ToggleFavoriteUseCase {
  final FavoritesRepo toggleFavouriteRepo;

  ToggleFavoriteUseCase({required this.toggleFavouriteRepo});
  Future<Either<Failure, ToggleFavoriteEntity>> call(String id) {
    return toggleFavouriteRepo.toggleFavourite(id);
  }
}
