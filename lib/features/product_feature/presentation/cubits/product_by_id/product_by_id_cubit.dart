import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_by_id_use_case.dart';

part 'product_by_id_state.dart';

class ProductByIdCubit extends Cubit<IProductByIdState> {
  final GetProductByIdUseCase _getProductByIdUseCase;
  ProductByIdCubit(this._getProductByIdUseCase)
    : super(ProductByIdInitialState());

  Future<void> getProductsById(String id) async {
    emit(ProductByIdLoadingState());
    final result = await _getProductByIdUseCase(id);
    result.fold(
      (failure) => emit(ProductByIdFailureState(failure: failure)),
      (result) => emit(ProductByIdSuccessState(getProductById: result)),
    );
  }
  @override
  void emit(IProductByIdState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
