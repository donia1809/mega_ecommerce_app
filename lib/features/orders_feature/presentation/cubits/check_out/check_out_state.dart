part of 'check_out_cubit.dart';

sealed class ICheckOutState extends Equatable {
  const ICheckOutState();

  @override
  List<Object?> get props => [];
}

final class CheckOutInitialState extends ICheckOutState {}

final class CheckOutLoadingState extends ICheckOutState {}

final class CheckOutSuccessState extends ICheckOutState {
  final ChecKOutEntity checKOutEntity;

  const CheckOutSuccessState({required this.checKOutEntity});

  @override
  List<Object?> get props => [checKOutEntity];
}

final class CheckOutFailureState extends ICheckOutState {
  final Failure failure;

  const CheckOutFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
