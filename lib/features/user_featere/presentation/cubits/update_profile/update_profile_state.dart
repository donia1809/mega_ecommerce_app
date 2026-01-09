part of 'update_profile_cubit.dart';

sealed class IUpdateProfileState extends Equatable {
  const IUpdateProfileState();

  @override
  List<Object?> get props => [];
}

final class UpdateProfileInitialState extends IUpdateProfileState {}

class UpdateProfileLoadingState extends IUpdateProfileState {}

class UpdateProfileFailureState extends IUpdateProfileState {
  final Failure failure;

  const UpdateProfileFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class UpdateProfileSuccessState extends IUpdateProfileState {
  final UserProfileEntity updateProfile;

  const UpdateProfileSuccessState({required this.updateProfile});

  @override
  List<Object?> get props => [updateProfile];
}
