import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/use_case/get_favorite_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<IGetFavoriteState> {
  final GetFavoriteProductsUseCase getFavoriteProductsUseCase;
  GetFavoriteCubit(this.getFavoriteProductsUseCase)
    : super(GetFavoriteInitialState());

  Future<void> getFavorite() async {
    emit(GetFavoriteLoadingState());
    final result = await getFavoriteProductsUseCase();
    result.fold(
      (failure) => emit(GetFavoriteFailureState(failure: failure)),
      (products) => emit(GetFavoriteSeccessState(products: products)),
    );
  }

  void removeFavorite({required ProductEntity newProduct})  {
    final state = this.state;
    if (state is GetFavoriteSeccessState) {
      final List<ProductEntity> tempProducts = [];

      for (ProductEntity product in state.products) {
        if (newProduct.id != product.id) {
          tempProducts.add(product);
        }
      }
      emit(state.copyWith(products: tempProducts));
    }
  }
}
