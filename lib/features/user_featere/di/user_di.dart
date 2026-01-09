import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/user_featere/data/data_source/user_profile_data_sorce.dart';
import 'package:mega_ecommerce_app/features/user_featere/data/repo_impl/user_profile_repo_impl.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/get_profile_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_email_ue_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_password_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_profile_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/update_email/update_email_cubit.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/update_password/update_password_cubit.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/user_profile/user_profile_cubit.dart';

Future<void> userDi() async {
  // Cubit
  sl.registerFactory(() => UserProfileCubit(sl()));
  sl.registerFactory(() => UpdateProfileCubit(sl()));
  sl.registerFactory(() => UpdateEmailCubit(sl()));
  sl.registerFactory(() => UpdatePasswordCubit(sl()));

  // UseCase
  sl.registerLazySingleton(() => GetUserProfileUseCase(userRepo: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(userProfileRepo: sl()));
  sl.registerLazySingleton(() => UpdateEmailUseCase(updateEmailRepo: sl()));
  sl.registerLazySingleton(
    () => UpdatePasswordUseCase(updatePasswordRepo: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProfileRepo>(
    () => UserProfileRepoImpl(userProfileRemoteDataSource: sl()),
  );

  // DataSource
  sl.registerLazySingleton<UserProfileDataSource>(
    () => UserProfileDataSourceImpl(apiHelper: sl()),
  );
}
