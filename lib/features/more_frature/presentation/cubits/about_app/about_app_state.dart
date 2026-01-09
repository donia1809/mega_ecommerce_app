part of 'about_app_cubit.dart';

sealed class IAboutAppState extends Equatable {
  const IAboutAppState();

  @override
  List<Object?> get props => [];
}

final class AboutAppInitialState extends IAboutAppState {}

class AboutAppFailureState extends IAboutAppState {
  final Failure failure;

  const AboutAppFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class AboutAppLoadingState extends IAboutAppState {}

class AboutAppSuccessState extends IAboutAppState {
  final MenuEntity about;

  const AboutAppSuccessState({required this.about});
  @override
  List<Object?> get props => [about];
}
