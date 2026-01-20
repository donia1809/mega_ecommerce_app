import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/decrease_qantity_use_case.dart';

part 'decrement_cart_item_quantity_state.dart';

class DecrementCartItemQuantityCubit
    extends Cubit<IDecrementCartItemQuantityState> {
  final DecrementCartItemQuantityUseCase _decrementCartItemQuantityUseCase;

  DecrementCartItemQuantityCubit(this._decrementCartItemQuantityUseCase)
    : super(DecrementCartItemQuantityInitialState());

  void decrementQuantity({required String id}) async {
    emit(DecrementCartItemQuantityLoadingState());
    final result = await _decrementCartItemQuantityUseCase(id);
    result.fold(
      (failure) =>
          emit(DecrementCartItemQuantityFailureState(failure: failure)),
      (_) => emit(DecrementCartItemQuantitySuccessState()),
    );
  }
}
