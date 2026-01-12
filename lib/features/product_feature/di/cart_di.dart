import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/data_source/add_review_data_source.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/data_source/product_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/repo_impl/add_review_repo_impl.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/repo_impl/product_repo_impl.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/repo/add_review_repo.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/repo/product_repo.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/add_review_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_by_id_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/add_review/add_review_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/product_by_id/product_by_id_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/product/product_cubit.dart';

Future<void> productDi() async {
  /// Cubits
  sl.registerFactory(() => ProductsCubit(sl<GetProductUseCase>()));

  sl.registerFactory(() => ProductByIdCubit(sl<GetProductByIdUseCase>()));

  sl.registerFactory(() => AddReviewCubit(sl<AddReviewUseCase>()));

  //!useCase

  sl.registerLazySingleton(() => GetProductUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => AddReviewUseCase(addReviewRepo: sl()));

  //!repo
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(productRemoteDataSource: sl()),
  );

  sl.registerLazySingleton<AddReviewRepo>(
    () => AddReviewRepoImpl(addReviewDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiHelper: sl()),
  );

  sl.registerLazySingleton<AddReviewDataSource>(
    () => AddReviewDataSourceImpl(apiHelper: sl()),
  );
}
