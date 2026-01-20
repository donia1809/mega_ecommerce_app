part of 'update_cart_item_quantity_cubit.dart';

sealed class IUpdateCartItemQuantityState extends Equatable {
  const IUpdateCartItemQuantityState();

  @override
  List<Object?> get props => [];
}

final class UpdateCartItemQuantityInitialState
    extends IUpdateCartItemQuantityState {}

final class UpdateCartItemQuantityLoadingState
    extends IUpdateCartItemQuantityState {}

final class UpdateCartItemQuantitySuccessState
    extends IUpdateCartItemQuantityState {
  final CartItemEntity cartItem;

  const UpdateCartItemQuantitySuccessState({required this.cartItem});
   @override
  List<Object?> get props => [cartItem];
}

final class UpdateCartItemQuantityFailureState
    extends IUpdateCartItemQuantityState {
  final Failure failure;

  const UpdateCartItemQuantityFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
