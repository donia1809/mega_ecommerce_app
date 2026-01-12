import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/favourite_entity.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/toggle_favourite_repo.dart';

class ToggleFavouriteUseCase {
  final ToggleFavouriteRepo toggleFavouriteRepo;

  ToggleFavouriteUseCase({required this.toggleFavouriteRepo});
  Future<Either<Failure, ToggleFavoriteEntity>> call(String id)
  {
    return toggleFavouriteRepo.toggleFavourite(id);
  }


}
