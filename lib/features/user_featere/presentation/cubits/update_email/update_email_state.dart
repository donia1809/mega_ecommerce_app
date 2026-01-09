part of 'update_email_cubit.dart';

sealed class IUpdateEmailState extends Equatable {
  const IUpdateEmailState();

  @override
  List<Object?> get props => [];
}

final class UpdateEmailInitialEmail extends IUpdateEmailState {}

class UpdateEmailLoadingState extends IUpdateEmailState {}

class UpdateEmailFailureState extends IUpdateEmailState {
  final Failure failure;

  const UpdateEmailFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class UpdateEmailSuccessState extends IUpdateEmailState {
  final UpdateProfileEntity updateEmail;

  const UpdateEmailSuccessState({required this.updateEmail});

  @override
  List<Object?> get props => [updateEmail];
}
