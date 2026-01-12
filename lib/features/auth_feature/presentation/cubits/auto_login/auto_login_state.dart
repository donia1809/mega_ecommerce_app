part of 'auto_login_cubit.dart';

sealed class IAutoLogintState extends Equatable {
  const IAutoLogintState();

  @override
  List<Object?> get props => [];
}

final class AutoLoginInitial extends IAutoLogintState {}

class AppUnAuthenticatedState extends IAutoLogintState {
  const AppUnAuthenticatedState();

  @override
  List<Object?> get props => [];
}

class AppAuthenticatedState extends IAutoLogintState {
  final CachedUserEntity user;
  const AppAuthenticatedState({required this.user});

  @override
  List<Object?> get props => [];
}

class AppGuestState extends IAutoLogintState {}
