import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/cart_feature/data/data_source/product_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/cart_feature/data/repo_impl/product_repo_impl.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/product_repo.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/get_product_by_id_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/get_product_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/product_by_id_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/product_cubit.dart';

Future<void> cartDi() async {
  /// Cubits
  sl.registerFactory(
    () => ProductsCubit(
      sl<GetProductUseCase>(),
    ),
  );

  sl.registerFactory(
    () => ProductByIdCubit(
      sl<GetProductByIdUseCase>(),
    ),
  );


  //!useCase

  sl.registerLazySingleton(() => GetProductUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(productRepo: sl()));
  
  //!repo
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(productRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiHelper: sl()),
  );
}
