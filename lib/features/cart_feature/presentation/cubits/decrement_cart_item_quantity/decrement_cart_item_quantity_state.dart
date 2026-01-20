part of 'decrement_cart_item_quantity_cubit.dart';

sealed class IDecrementCartItemQuantityState extends Equatable {
  const IDecrementCartItemQuantityState();

  @override
  List<Object?> get props => [];
}

final class DecrementCartItemQuantityInitialState
    extends IDecrementCartItemQuantityState {}

final class DecrementCartItemQuantityLoadingState
    extends IDecrementCartItemQuantityState {}

final class DecrementCartItemQuantitySuccessState
    extends IDecrementCartItemQuantityState {}

final class DecrementCartItemQuantityFailureState
    extends IDecrementCartItemQuantityState {
  final Failure failure;

  const DecrementCartItemQuantityFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
