import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/core/domain/entity/language/app_language_enum.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/language_use_cases/get_saved_language_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/language_use_cases/saved_language_use_case.dart';

part 'language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  final GetCachedLanguageUseCase getCachedLanguageUseCase;
  final SavedLanguageUseCase savedLanguageUseCase;

  AppLanguageCubit({
    required this.getCachedLanguageUseCase,
    required this.savedLanguageUseCase,
  }) : super(const AppLanguageState.initial());

  Future<void> getSavedLanguage() async //from cache
  {
    final appCachedLanguage = await getCachedLanguageUseCase();
    appCachedLanguage.fold(
       (failure) => (_){},
      (language) => emit(state.copyWith(language: language)),
    );
  }

  Future<void> updateLanguage(AppLanguageEnum language) async {
    final appSavedLanguage = await savedLanguageUseCase(language);
    appSavedLanguage.fold(
       (failure) => (_){},
      (language) => emit(state.copyWith(language: language)),
      );
  }
}
