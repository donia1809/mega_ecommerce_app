import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/favourite_entity.dart';

abstract class ToggleFavouriteRepo {
  Future<Either<Failure, ToggleFavoriteEntity>> toggleFavourite(String id);
}
