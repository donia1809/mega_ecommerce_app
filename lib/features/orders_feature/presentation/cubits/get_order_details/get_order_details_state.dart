part of 'get_order_details_cubit.dart';

sealed class IGetOrderDetailsState extends Equatable {
  const IGetOrderDetailsState();

  @override
  List<Object?> get props => [];
}

final class GetOrderDetailsInitialState extends IGetOrderDetailsState {}

final class GetOrderDetailsLoadingState extends IGetOrderDetailsState {}

final class GetOrderDetailsSuccessState extends IGetOrderDetailsState {
  final OrderEntity order;

  const GetOrderDetailsSuccessState({required this.order});
  @override
  List<Object?> get props => [order];
}

final class GetOrderDetailsFailureState extends IGetOrderDetailsState {
  final Failure failure;

  const GetOrderDetailsFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
