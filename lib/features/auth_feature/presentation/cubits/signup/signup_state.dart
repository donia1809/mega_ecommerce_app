part of 'signup_cubit.dart';

sealed class ISignupState extends Equatable {
  const ISignupState();
  @override
  List<Object?> get props => [];
}

class SignupInitialState extends ISignupState {
  const SignupInitialState();
}

class SignupFailureState extends ISignupState {
  final Failure failure;

  const SignupFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class SignupLoadingState extends ISignupState {}

class SignupSuccessState extends ISignupState {
  final AuthEntity data;

  const SignupSuccessState({required this.data});
  @override
  List<Object?> get props => [data];
}
