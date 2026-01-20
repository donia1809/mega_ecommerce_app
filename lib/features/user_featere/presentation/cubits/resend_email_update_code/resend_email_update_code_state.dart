part of 'resend_email_update_code_cubit.dart';

sealed class IResendEmailUpdateState extends Equatable {
  const IResendEmailUpdateState();

  @override
  List<Object?> get props => [];
}

final class ResendEmailUpdateInitialState extends IResendEmailUpdateState {}

final class ResendEmailUpdateLoadingState extends IResendEmailUpdateState {}

final class ResendEmailUpdateSuccessState extends IResendEmailUpdateState 
{
  
}

final class ResendEmailUpdateFailureState extends IResendEmailUpdateState 
{
  final Failure failure;

  const ResendEmailUpdateFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
