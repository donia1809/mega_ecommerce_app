import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/data_source/toggle_favourite_data_source.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/repo_impl/toggle_favourite_repo_impl.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/repo/toggle_favourite_repo.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/use_case/toggle_favourite_use_case.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/cubit/toggle_favourite/toggle_favourite_cubit.dart';

Future<void> toggleFavouriteDi() async {
  /// Cubits
  sl.registerFactory(() => ToggleFavouriteCubit(sl()));
  
  //!useCase
  sl.registerLazySingleton(() => ToggleFavouriteUseCase(toggleFavouriteRepo: sl()));
 

  //!repo
  sl.registerLazySingleton<ToggleFavouriteRepo>(() => ToggleFavouriteRepoImpl(toggleFavouriteDataSource: sl()));

  //! Data sources
  sl.registerLazySingleton<ToggleFavouriteDataSource>(
    () => ToggleFavouriteDataSourceImpl(apiHelper: sl()),
  );
}
