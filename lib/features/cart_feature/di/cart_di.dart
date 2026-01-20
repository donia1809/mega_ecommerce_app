import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/cart_feature/data/data_source/cart_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/cart_feature/data/repository_implement/cart_repository_implement.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/repo/cart_repository.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/decrease_qantity_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/get_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/increase_quantity_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/remove_from_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/update_quantity_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/cart/cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/decrement_cart_item_quantity/decrement_cart_item_quantity_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/increment_cart_item_quantity/increment_cart_item_quantity_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/remove_from_cart/remove_from_cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/update_cart_item_quantity/update_cart_item_quantity_cubit.dart';

Future<void> cartDi() async {
  /// Cubits
  sl.registerFactory(() => CartCubit(sl()));
  sl.registerFactory(() => AddToCartCubit(sl()));
  sl.registerFactory(() => RemoveFromCartCubit(sl()));
  sl.registerFactory(() => IncrementCartItemQuantityCubit(sl()));
  sl.registerFactory(() => DecrementCartItemQuantityCubit(sl()));
  sl.registerFactory(() => UpdateCartItemQuantityCubit(sl()));


  //!useCase

  sl.registerLazySingleton(() => GetCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton(() => AddProductToCartUseCase(addToCartRepo: sl()));
  sl.registerLazySingleton(
    () => RemoveFromCartUseCase(removeFromCartRepo: sl()),
  );
  sl.registerLazySingleton(
    () => IncrementCartItemQuantityUseCase(incrementQuantityRepo: sl()),
  );
  sl.registerLazySingleton(
    () => DecrementCartItemQuantityUseCase(decrementQuantityRepo: sl()),
  );
  sl.registerLazySingleton(
    () => UpdateCartItemQuantityUseCase(updateQuantityRepo: sl()),
  );

  //!repo
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImplement(cartRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(apiHelper: sl()),
  );
}
