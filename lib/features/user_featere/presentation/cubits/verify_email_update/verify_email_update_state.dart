part of 'verify_email_update_cubit.dart';

sealed class IVerifyEmailUpdateState extends Equatable {
  const IVerifyEmailUpdateState();

  @override
  List<Object?> get props => [];
}

final class IVerifyEmailUpdateInitialState extends IVerifyEmailUpdateState {}

class VerifyEmailUpdateLoadingState extends IVerifyEmailUpdateState {}

class VerifyEmailUpdateFailureState extends IVerifyEmailUpdateState {
  final Failure failure;

  const VerifyEmailUpdateFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class VerifyEmailUpdateSuccessState extends IVerifyEmailUpdateState {
  final UpdateProfileEntity verifyEmail;

  const VerifyEmailUpdateSuccessState({required this.verifyEmail});

  @override
  List<Object?> get props => [verifyEmail];
}
