import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/data_source/favourite_data_source.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/toggle_favorite_entity.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/favorites_repo.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class FavoriteRepoImpl implements FavoritesRepo {
  final FavoriteDataSource favouriteDataSource;

  FavoriteRepoImpl({required this.favouriteDataSource});
  @override
  Future<Either<Failure, ToggleFavoriteEntity>> toggleFavourite(
    String id,
  ) async {
    try {
      final result = await favouriteDataSource.toggleFavourite(id);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorite() async {
    try {
      final result = await favouriteDataSource.getFavorite();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
