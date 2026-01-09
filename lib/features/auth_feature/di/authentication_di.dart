import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/save_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/save_user_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/data/data_source/auth_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/auth_feature/data/repo_impl/auth_repo_impl.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/log_out_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/login_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/signup_use_cases.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/verify_account_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/login/login_cubit.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/logout/logout_cubit.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/signup/signup_cubit.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/verify_account/verify_account_cubit.dart';

Future<void> initAuthenticationDi() async {
  /// Cubits
  sl.registerFactory(
    () => LoginCubit(
      sl<LoginUseCase>(),
      sl<SaveTokenUseCase>(),
      sl<SaveUserUseCase>(),
    ),
  );

  sl.registerFactory(
    () => SignupCubit(
      sl<SignupUseCase>(),
      sl<SaveTokenUseCase>(),
      sl<SaveUserUseCase>(),
    ),
  );

  sl.registerFactory(
    () => VerifyAccountCubit(
      sl<VerifyAccountUseCase>(),
      sl<SaveTokenUseCase>(),
      sl<SaveUserUseCase>(),
    ),
  );

  sl.registerFactory(
    () => LogoutCubit(     
      sl<LogoutUseCase>()
    ),
  );


  //!useCase

  sl.registerLazySingleton(() => LoginUseCase(authRepo: sl()));
  sl.registerLazySingleton(() => SignupUseCase(authRepo: sl()));
  sl.registerLazySingleton(() => VerifyAccountUseCase(authRepo: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(authRepo: sl(),deleteTokenUseCase:sl(),deleteUserUseCase: sl()));

  //!repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiHelper: sl()),
  );
}
