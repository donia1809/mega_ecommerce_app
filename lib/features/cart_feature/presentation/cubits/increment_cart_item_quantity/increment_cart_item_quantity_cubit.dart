import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/increase_quantity_use_case.dart';

part 'increment_cart_item_quantity_state.dart';

class IncrementCartItemQuantityCubit
    extends Cubit<IIncrementCartItemQuantityState> {
  final IncrementCartItemQuantityUseCase _incrementCartItemQuantityUseCase;
  IncrementCartItemQuantityCubit(this._incrementCartItemQuantityUseCase)
    : super(IncrementCartItemQuantityInitialState());

  void incrementQuantity({required String id}) async {
    emit(IncrementCartItemQuantityLoadingState());
    final result = await _incrementCartItemQuantityUseCase(id);
    result.fold(
      (failure)=> emit(IncrementCartItemQuantityFailureState(failure: failure)), 
      (_)=>emit(IncrementCartItemQuantitySuccessState()),
      );
  }
}
