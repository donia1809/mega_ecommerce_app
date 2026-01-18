part of 'increase_value_cubit.dart';

sealed class IIncreaseValueState extends Equatable {
  const IIncreaseValueState();

  @override
  List<Object?> get props => [];
}

final class IncreaseValueInitialState extends IIncreaseValueState {}

final class IncreaseValueLoadingState extends IIncreaseValueState {}

final class IncreaseValueSuccessState extends IIncreaseValueState {}

final class IncreaseValueFailureState extends IIncreaseValueState {
  final Failure failure;

  const IncreaseValueFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

