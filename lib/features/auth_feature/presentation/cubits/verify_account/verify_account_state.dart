part of 'verify_account_cubit.dart';

sealed class IVerifyAccountState extends Equatable {
  const IVerifyAccountState();

  @override
  List<Object?> get props => [];
}

final class VerifyAccountInitialState extends IVerifyAccountState {}

class VerifyAccountFailureState extends IVerifyAccountState {
  final Failure failure;

  const VerifyAccountFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class VerifyAccountLoadingState extends IVerifyAccountState {}

class VerifyAccountSuccessState extends IVerifyAccountState {
  final VerificationCodeEnum verificationCode;

  const VerifyAccountSuccessState(this.verificationCode);
  @override
  List<Object?> get props => [];
}
