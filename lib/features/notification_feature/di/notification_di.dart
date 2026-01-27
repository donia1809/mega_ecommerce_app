import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/notification_feature/data/data_source/notification_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/notification_feature/data/repository_implement/notification_repository_implement.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/repository/notification_repository.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/use_case/get_notifications_use_case.dart';
import 'package:mega_ecommerce_app/features/notification_feature/presentation/cubits/notification/notification_cubit.dart';

Future<void> notificationDi() async {
  /// Cubits
  sl.registerFactory(() => NotificationCubit(sl()));
  
  //!useCase
  sl.registerLazySingleton(() => GetNotificationsUseCase(notificationRepo: sl()));
  

  //!repo
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImplement(notificationRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImplement(apiHelper: sl()),
  );
}