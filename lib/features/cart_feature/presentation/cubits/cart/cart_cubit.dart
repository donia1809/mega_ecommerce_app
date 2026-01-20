import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_item_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/get_cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<ICartState> {
  final GetCartUseCase _getCartUseCase;
  CartCubit(this._getCartUseCase) : super(CartInitialState());

  void getCart() async {
    emit(CartLoadingState());
    final result = await _getCartUseCase();
    result.fold((failure) => emit(CartFailureState(failure: failure)), (
      result,
    ) {
      emit(CartSuccessState(cartItems: result.cartItems));
    });
  }

  void removeCart({required String cartItemId}) {
    final state = this.state;
    if (state is CartSuccessState) {
      final List<CartItemEntity> tempItems = [];
      for (CartItemEntity item in state.cartItems) {
        if (cartItemId != item.id) {
          tempItems.add(item);
        }
      }
      emit(state.copyWith(cartItems: tempItems));
    }
  }

  void updateQuantity({required String productId, required int newQuantity}) {
    final state = this.state;
    if (state is CartSuccessState) {
      final List<CartItemEntity> tempItems = [];
      for (CartItemEntity item in state.cartItems) {
        if (productId == item.productId) {
          tempItems.add(item.copyWith(quantity: newQuantity));
        } else {
          tempItems.add(item);
        }
      }
      emit(state.copyWith(cartItems: tempItems));
    }
  }
}
