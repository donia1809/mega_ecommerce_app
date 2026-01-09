part of 'logout_cubit.dart';

sealed class ILogoutState extends Equatable {
  const ILogoutState();

  @override
  List<Object?> get props => [];
}

class LogoutInitialState extends ILogoutState {
  const LogoutInitialState();
}

class LogoutLoadingState extends ILogoutState {}

class LogoutSuccessState extends ILogoutState {
  const LogoutSuccessState();
}

class LogoutFailureState extends ILogoutState {
  final Failure failure;

  const LogoutFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
