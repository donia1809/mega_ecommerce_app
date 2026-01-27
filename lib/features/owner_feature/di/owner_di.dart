import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/owner_feature/data/data_source/owner_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/owner_feature/data/repository_implement/owner_repository_implement.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/repository/owner_repository.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/create_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/get_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/delete_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/update_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/presentation/cubits/create_product/create_product_cubit.dart';
import 'package:mega_ecommerce_app/features/owner_feature/presentation/cubits/owner_product/owner_product_cubit.dart';
import 'package:mega_ecommerce_app/features/owner_feature/presentation/cubits/delete_product/delete_product_cubit.dart';
import 'package:mega_ecommerce_app/features/owner_feature/presentation/cubits/update_owner_product/update_owner_product_cubit.dart';

Future<void> ownerDi() async {
  /// Cubits
  sl.registerFactory(() => OwnerProductCubit(sl()));
  sl.registerFactory(() => UpdateOwnerProductCubit(sl()));
  sl.registerFactory(() => CreateProductCubit(sl()));
  sl.registerFactory(() => DeleteProductCubit(sl()));

  //!useCase
  sl.registerLazySingleton(() => GetOwnerProductUseCase(ownerRepo: sl()));
  sl.registerLazySingleton(() => UpdateOwnerProductUseCase(ownerRepo: sl()));
  sl.registerLazySingleton(() => CreateProductUseCase(ownerRepo: sl()));
  sl.registerLazySingleton(() => DeleteProductUseCase(ownerRepo: sl()));

  //!repo
  sl.registerLazySingleton<OwnerRepository>(
    () => OwnerRepositoryImplement(ownerRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<OwnerRemoteDataSource>(
    () => OwnerRemoteDataSourceImpl(apiHelper: sl()),
  );
}
