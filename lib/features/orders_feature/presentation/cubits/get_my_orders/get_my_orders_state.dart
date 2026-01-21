part of 'get_my_orders_cubit.dart';

sealed class IGetMyOrdersState extends Equatable {
  const IGetMyOrdersState();

  @override
  List<Object?> get props => [];
}

final class GetMyOrdersInitialState extends IGetMyOrdersState {}

final class GetMyOrdersLoadingState extends IGetMyOrdersState {}

final class GetMyOrdersSuccessState extends IGetMyOrdersState {
  final MyOrdersEntity orders;

  const GetMyOrdersSuccessState({required this.orders});
  
  @override
  List<Object?> get props => [orders];
}

final class GetMyOrdersFailureState extends IGetMyOrdersState {
  final Failure failure;

  const GetMyOrdersFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
