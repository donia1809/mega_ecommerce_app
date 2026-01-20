import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_item_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/add_product_to_cart_use_case.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<IAddToCartState> {
  final AddProductToCartUseCase _addProductToCartUseCase;
  AddToCartCubit(this._addProductToCartUseCase)
    : super(AddToCartInitialState(0));

  Future<void> addToCart(AddProductToCartParams params) async {
    emit(AddToCartLoadingState());
    final items = await _addProductToCartUseCase(params);
    items.fold(
      (failure) => emit(AddToCartFailureState(failure: failure)),
      (items) => emit(AddToCartSuccessState(items: items.cartItems)),
    );
  }


}
