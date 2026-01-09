import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mega_ecommerce_app/core/cubit/language_cubit.dart';
import 'package:mega_ecommerce_app/core/data/data_source/cached_authenticated_data_source.dart';
import 'package:mega_ecommerce_app/core/data/data_source/language_data_source.dart';
import 'package:mega_ecommerce_app/core/data/repository_implemement/cached_authenticated_repo_impl.dart';
import 'package:mega_ecommerce_app/core/data/repository_implemement/language_cached_repo_impl.dart';
import 'package:mega_ecommerce_app/core/domain/repository/cached_authenticated_repo.dart';
import 'package:mega_ecommerce_app/core/domain/repository/language_cached_repo.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/delete_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/get_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/save_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/delete_user_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/get_user_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/save_user_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/language_use_cases/clear_language_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/language_use_cases/get_saved_language_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/language_use_cases/saved_language_use_case.dart';
import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/core/network/dio_api_helper.dart';
import 'package:mega_ecommerce_app/features/auth_feature/di/authentication_di.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/auto_login/auto_login_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/di/cart_di.dart';
import 'package:mega_ecommerce_app/features/more_frature/di/menu_di.dart';
import 'package:mega_ecommerce_app/features/user_featere/di/user_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! cobit || bloc
  sl.registerFactory(
    () => AppLanguageCubit(
      getCachedLanguageUseCase: sl(),
      savedLanguageUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => AutoLoginCubit(sl<GetTokenUseCase>(), sl<GetUserUseCase>()),
  );
  //!useCase
  sl.registerLazySingleton(
    () => SavedLanguageUseCase(languageCachedRepo: sl()),
  );

  sl.registerLazySingleton(
    () => GetCachedLanguageUseCase(languageCachedRepo: sl()),
  );

  sl.registerLazySingleton(
    () => ClearLanguageUseCase(languageCachedRepo: sl()),
  );

  sl.registerLazySingleton(
    () => DeleteTokenUseCase(cachedAuthenticatedRepo: sl()),
  );

  sl.registerLazySingleton(
    () => GetTokenUseCase(cachedAuthenticatedRepo: sl()),
  );

  sl.registerLazySingleton(
    () => SaveTokenUseCase(cachedAuthenticatedRepo: sl()),
  );

  sl.registerLazySingleton(
    () => DeleteUserUseCase(cachedAuthenticatedRepo: sl()),
  );

  sl.registerLazySingleton(() => GetUserUseCase(cachedAuthenticatedRepo: sl()));

  sl.registerLazySingleton(
    () => SaveUserUseCase(cachedAuthenticatedRepo: sl()),
  );

  //!repo
  sl.registerLazySingleton<AppLanguageCachedRepo>(
    () => AppLanguageCachedRepoImpl(languageDataSource: sl()),
  );

  sl.registerLazySingleton<CachedAuthenticatedRepo>(
    () => CachedAuthenticatedRepoImpl(cachedAuthenticatedDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<LanguageDataSource>(
    () => LanguageDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<CachedAuthenticatedDataSource>(
    () => CachedAuthenticatedDataSourceImpl(storage: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiHelper>(
    () => DioApiHelper(dio: sl(), getTokenUseCase: sl()),
  );
  final storage = FlutterSecureStorage(
    aOptions: AndroidOptions.biometric(enforceBiometrics: false),
  );
  sl.registerLazySingleton(() => storage);

  /// Feature DI
  initAuthenticationDi();
  cartDi();
  menuDi();
  userDi();
}
