import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/core/utiles/debouncer_timer.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_item_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/update_quantity_use_case.dart';

part 'update_cart_item_quantity_state.dart';

class UpdateCartItemQuantityCubit extends Cubit<IUpdateCartItemQuantityState> {
  final DebouncerTimer _debouncer = DebouncerTimer(milliseconds: 500);

  final UpdateCartItemQuantityUseCase _updateCartItemQuantityUseCase;
  UpdateCartItemQuantityCubit(this._updateCartItemQuantityUseCase)
    : super(UpdateCartItemQuantityInitialState());
  void updateQuantity({required UpdateQuantityParams params})  {
    _debouncer.run(() async {
    emit(UpdateCartItemQuantityLoadingState());
    final result = await _updateCartItemQuantityUseCase(params);
    result.fold(
      (failure) => emit(UpdateCartItemQuantityFailureState(failure: failure)),
      (cartItem) {
        final updatedItem = cartItem.cartItems.firstWhere(
          (item) => item.productId == params.productId,

        );
        emit(UpdateCartItemQuantitySuccessState(cartItem: updatedItem));
      },
    );
    emit(UpdateCartItemQuantityInitialState());
    
    });
  }

  @override
  Future<void> close() {
    _debouncer.cancle();
    return super.close();
  } 
}
