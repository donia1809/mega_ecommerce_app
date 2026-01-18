import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/remove_from_cart_use_case.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<IRemoveFromCartState> {
  final RemoveFromCartUseCase _removeFromCartUseCase;
  RemoveFromCartCubit(this._removeFromCartUseCase)
    : super(RemoveFromCartInitialState());
  void removeFromCart({required String cartId}) async {
    emit(RemoveFromCartLoadingState());
    final result = await _removeFromCartUseCase(cartId);
    result.fold(
      (failure) => emit(RemoveFromCartFailursState(failure: failure)),
      (_) => emit(RemoveFromCartSuccessState()),
    );
  }
}
