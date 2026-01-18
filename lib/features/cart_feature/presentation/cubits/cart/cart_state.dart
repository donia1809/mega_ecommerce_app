part of 'cart_cubit.dart';

sealed class ICartState extends Equatable {
  const ICartState();
  ICartState copyWith();
  @override
  List<Object?> get props => [];
}

final class CartInitialState extends ICartState {
  @override
  ICartState copyWith() {
    return this;
  }
}

final class CartLoadingState extends ICartState {
  @override
  ICartState copyWith() {
    return this;
  }
}

final class CartSuccessState extends ICartState {
  final List<CartItemEntity> cartItems;

  const CartSuccessState({ required this.cartItems});

 double get calculateTotalPrice{
    double total = 0;
    for (CartItemEntity item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }


  @override
  List<Object?> get props => [cartItems];

  @override
  CartSuccessState copyWith({
    final List<CartItemEntity>? cartItems,
  }) {
    return CartSuccessState(
      cartItems: cartItems ?? this.cartItems,
    );
  }
}

final class CartFailureState extends ICartState {
  final Failure failure;

  const CartFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];

  @override
  ICartState copyWith() {
    return this;
  }
}
