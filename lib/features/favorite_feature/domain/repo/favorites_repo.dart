import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/toggle_favorite_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, ToggleFavoriteEntity>> toggleFavourite(String id);
  Future<Either<Failure, List<ProductEntity>>> getFavorite();
}
