import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/data_source/toggle_favourite_data_source.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/favourite_entity.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/toggle_favourite_repo.dart';

class ToggleFavouriteRepoImpl implements ToggleFavouriteRepo {
  final ToggleFavouriteDataSource toggleFavouriteDataSource;

  ToggleFavouriteRepoImpl({required this.toggleFavouriteDataSource});
  @override
  Future<Either<Failure, ToggleFavoriteEntity>> toggleFavourite(
    String id,
  ) async {
    try {
      final result = await toggleFavouriteDataSource.toggleFavourite(id);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
