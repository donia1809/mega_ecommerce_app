part of 'add_to_cart_cubit.dart';

sealed class IAddToCartState extends Equatable {
  const IAddToCartState();

  IAddToCartState copyWith();
  @override
  List<Object> get props => [];
}

final class AddToCartInitialState extends IAddToCartState {
  final int quantity;
  const AddToCartInitialState(this.quantity);

  @override
  IAddToCartState copyWith() {
    return this;
  }
}

final class AddToCartLoadingState extends IAddToCartState {
  @override
  IAddToCartState copyWith() {
    return this;
  }
}

final class AddToCartSuccessState extends IAddToCartState {
  final List<CartItemEntity> items;
  const AddToCartSuccessState({required this.items});
  @override
  AddToCartSuccessState copyWith({final List<CartItemEntity>? items}) {
    return AddToCartSuccessState(items: items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}

final class AddToCartFailureState extends IAddToCartState {
  final Failure failure;

  const AddToCartFailureState({required this.failure});
  @override
  IAddToCartState copyWith() {
    return this;
  }

  @override
  List<Object> get props => [failure];
}
