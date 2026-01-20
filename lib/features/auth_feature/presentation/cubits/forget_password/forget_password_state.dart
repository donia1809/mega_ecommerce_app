part of 'forget_password_cubit.dart';

sealed class IForgetPasswordState extends Equatable {
  const IForgetPasswordState();

  @override
  List<Object?> get props => [];
}

final class ForgetPasswordInitialState extends IForgetPasswordState {}

final class ForgetPasswordLoadingState extends IForgetPasswordState {}

final class ForgetPasswordSuccessState extends IForgetPasswordState {}

final class ForgetPasswordFailureState extends IForgetPasswordState {
  final Failure failure;

  const ForgetPasswordFailureState({required this.failure});
  @override
  List<Object?> get props => [failure]; 
  
}
