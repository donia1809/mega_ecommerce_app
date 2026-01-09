part of 'update_password_cubit.dart';

sealed class IUpdatePasswordState extends Equatable {
  const IUpdatePasswordState();

  @override
  List<Object?> get props => [];
}

final class UpdatePasswordInitialState extends IUpdatePasswordState {}

class UpdatePasswordLoadingState extends IUpdatePasswordState {}

class UpdatePasswordFailureState extends IUpdatePasswordState {
  final Failure failure;

  const UpdatePasswordFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class UpdatePasswordSuccessState extends IUpdatePasswordState {
  final UpdateProfileEntity updatePassword;

  const UpdatePasswordSuccessState({required this.updatePassword});

  @override
  List<Object?> get props => [updatePassword];
}
