part of 'language_cubit.dart';

class AppLanguageState extends Equatable {
  final AppLanguageEnum language;

  const AppLanguageState({required this.language});
  const AppLanguageState.initial() : this(language: AppLanguageEnum.en);

  AppLanguageState copyWith({final AppLanguageEnum? language}) {
    return AppLanguageState(language: language ?? this.language);
  }

  @override
  List<Object> get props => [language];
}
