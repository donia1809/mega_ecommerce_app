part of 'auto_login_cubit.dart';

sealed class IAutoLogintState extends Equatable {
  const IAutoLogintState();

  @override
  List<Object?> get props => [];
}

final class AutoLoginInitial extends IAutoLogintState {}

class AppUnAuthenticatedState extends IAutoLogintState {
  final Failure failure;

  const AppUnAuthenticatedState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class AppAuthenticatedState extends IAutoLogintState {

  const AppAuthenticatedState();

  @override
  List<Object?> get props => [];
}

class AppGuestState extends IAutoLogintState {}
