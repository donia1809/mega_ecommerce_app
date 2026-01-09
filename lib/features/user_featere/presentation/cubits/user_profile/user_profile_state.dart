part of 'user_profile_cubit.dart';

sealed class IUserProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserProfileInitialState extends IUserProfileState {}

class UserProfileLoadingState extends IUserProfileState {}

class UserProfileFailureState extends IUserProfileState {
  final Failure failure;

   UserProfileFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class UserProfileSuccessState extends IUserProfileState {
  final UserProfileEntity profile;

  UserProfileSuccessState({required this.profile});

  @override
  List<Object?> get props => [profile];
}
