import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/data_source/favourite_data_source.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/repo_impl/favourite_repo_impl.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/favorites_repo.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/use_case/get_favorite_use_case.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/use_case/toggle_favourite_use_case.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/cubit/get_favorite/get_favorite_cubit.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/cubit/toggle_favorite/toggle_favourite_cubit.dart';

Future<void> favoriteDi() async {
  /// Cubits
  sl.registerFactory(() => ToggleFavoriteCubit(sl()));
  sl.registerFactory(() => GetFavoriteCubit(sl()));

  //!useCase
  sl.registerLazySingleton(
    () => ToggleFavoriteUseCase(toggleFavouriteRepo: sl()),
  );
  sl.registerLazySingleton(
    () => GetFavoriteProductsUseCase(getFavoriteRepo: sl()),
  );

  //!repo
  sl.registerLazySingleton<FavoritesRepo>(
    () => FavoriteRepoImpl(favouriteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<FavoriteDataSource>(
    () => FavoriteDataSourceImpl(apiHelper: sl()),
  );
}
