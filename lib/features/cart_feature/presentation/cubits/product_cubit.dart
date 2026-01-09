import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/get_product_use_case.dart';

part 'product_state.dart';

class ProductsCubit extends Cubit<IProductsState> {
  ProductParams? _lastParams;

  final GetProductUseCase _getProductUseCase;
  ProductsCubit(this._getProductUseCase)
    : super(ProductsInitialState());

  Future<void> getAllProducts(ProductParams params) async {
  _lastParams = params;
  emit(ProductsLoadingState());

  final result = await _getProductUseCase(params);

  result.fold(
    (failure) => emit(ProductsFailureState(failure: failure)),
    (result) => emit(ProductsSuccessState(products: result.products)),
  );
}


Future<void> refreshProducts() async {
  if (_lastParams == null) return;

  emit(ProductsRefreshingState());

  final result = await _getProductUseCase(_lastParams!);

  result.fold(
    (failure) => emit(ProductsFailureState(failure: failure)),
    (result) => emit(ProductsSuccessState(products: result.products)),
  );
}

}
