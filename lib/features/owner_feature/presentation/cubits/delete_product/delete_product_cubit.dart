import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/delete_product_use_case.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<IDeleteProductState> {
  final DeleteProductUseCase _deleteProductUseCase;
  DeleteProductCubit(this._deleteProductUseCase)
    : super(DeleteProductInitialState());
  void deleteProduct(String productId) async {
    emit(DeleteProductLoadingState());
    final result = await _deleteProductUseCase(productId);
    result.fold(
      (failure) => emit(DeleteProductFailureState(failure: failure)),
      (_) => emit(DeleteProductSuccessState()),
    );
  }

  @override
  void emit(IDeleteProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
