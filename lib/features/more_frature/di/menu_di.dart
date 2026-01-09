import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/more_frature/data/data_source/menu_data_source.dart';
import 'package:mega_ecommerce_app/features/more_frature/data/repo_impl/menu_repo_impl.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/repo/menu_repo.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/use_case/get_about_app_use_case.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/use_case/get_privacy_policy_use_case.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/use_case/get_terms_and_conditions_use_case.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/cubits/about_app/about_app_cubit.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/cubits/privacy_policy/privacy_policy_cubit.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/cubits/terms_and_conditions/terms_and_conditions_cubit.dart';

Future<void> menuDi() async {
  /// Cubits
  sl.registerFactory(() => TermsAndConditionsCubit(sl()));
  sl.registerFactory(() => PrivacyPolicyCubit(sl()));
  sl.registerFactory(() => AboutAppCubit(sl()));

  //!useCase

  sl.registerLazySingleton(() => GetTermsAndConditionsUseCase(termsRepo: sl()));
  sl.registerLazySingleton(() => GetPrivacyPolicyUseCase(privacyPolicyRepo: sl()));
  sl.registerLazySingleton(() => GetAboutAppUseCase(aboutAppRepo: sl()));

  //!repo
  sl.registerLazySingleton<MenuRepo>(() => MenuRepoImpl(menuDataSource: sl()));

  //! Data sources
  sl.registerLazySingleton<MenuDataSource>(
    () => MenuDataSourceImpl(apiHelper: sl()),
  );
}
