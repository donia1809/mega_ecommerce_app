import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/request_feature/data/data_source/request_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/request_feature/data/repository_implement/request_repository_implement.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/repository/request_repository.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/use_cases/send_request_use_case.dart';
import 'package:mega_ecommerce_app/features/request_feature/presentation/cubits/send_request/send_request_cubit.dart';

Future<void> requestDi() async 
{
  /// Cubits
  sl.registerFactory(() => SendRequestCubit(sl()));

  //!useCase
  sl.registerLazySingleton(() => SendRequestUseCase(requestRepo: sl()));

  //!repo
  sl.registerLazySingleton<RequestRepository>(
    () => RequestRepositoryImplement(requestRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<RequestRemoteDataSource>(
    () => RequestRemoteDataSourceImplement(apiHelper: sl()),
  );
}
