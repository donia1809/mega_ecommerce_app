import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';

part 'product_state.dart';

class ProductsCubit extends Cubit<IProductsState> {
  final GetProductUseCase _getProductUseCase;
  ProductsCubit(this._getProductUseCase) : super(ProductsInitialState());

  void getAllProducts(ProductParams params) async {
    emit(ProductsLoadingState());

    final result = await _getProductUseCase(params);

    result.fold(
      (failure) => emit(ProductsFailureState(failure: failure)),
      (result) => emit(ProductsSuccessState(products: result.products)),
    );
  }

  void updateProduct({required ProductEntity newProduct}) async {
    final state = this.state;
    if (state is ProductsSuccessState) {
      final List<ProductEntity> stateProducts = [...state.products];
      final List<ProductEntity> tempProducts = [];

      for (ProductEntity product in stateProducts) {
        if (newProduct.id == product.id) {
          tempProducts.add(newProduct);
        } else {
          tempProducts.add(product);
        }
      }

      emit(state.copyWith(products: tempProducts));
    }
  }
  @override
  void emit(IProductsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
