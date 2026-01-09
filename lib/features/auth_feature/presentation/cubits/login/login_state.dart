part of 'login_cubit.dart';

sealed class ILoginState extends Equatable {
  const ILoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitalState extends ILoginState {
  const LoginInitalState();
}

class LoginFailureState extends ILoginState {
  final Failure failure;

  const LoginFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class LoginLoadingState extends ILoginState {}

class LoginSuccessState extends ILoginState {
  final AuthEntity data;

  const LoginSuccessState({required this.data});
  @override
  List<Object?> get props => [data];
}
