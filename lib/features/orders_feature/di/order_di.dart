
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/data_source/order_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/repository_implement/orders_repository_implement.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/repository/order_repository.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/check_out_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_my_orders_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_order_details_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/cubits/check_out/check_out_cubit.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/cubits/get_my_orders/get_my_orders_cubit.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/cubits/get_order_details/get_order_details_cubit.dart';

Future<void> orderDi() async {
  /// Cubits
  sl.registerFactory(() => CheckOutCubit(sl()));
  sl.registerFactory(() => GetMyOrdersCubit(sl()));
  sl.registerFactory(() => GetOrderDetailsCubit(sl()));
  

  //!useCase

  sl.registerLazySingleton(() => CheckOutUseCase(orderRepo: sl()));
  sl.registerLazySingleton(() => GetMyOrdersUseCase(orderRepo: sl()));
  sl.registerLazySingleton(() => GetOrderDetailsUseCase(orderRepo: sl()));


  //!repo
  sl.registerLazySingleton<OrderRepository>(
    () => OrdersRepositoryImplement(orderRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(apiHelper: sl()),
  );
}
