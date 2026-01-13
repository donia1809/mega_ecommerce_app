part of 'product_cubit.dart';

sealed class IProductsState extends Equatable {
  const IProductsState();

  IProductsState copyWith();

  @override
  List<Object?> get props => [];
}

final class ProductsInitialState extends IProductsState {
  @override
  IProductsState copyWith() {
    return this;
  }
}

class ProductsLoadingState extends IProductsState {
  @override
  IProductsState copyWith() {
    return this;
  }
}

class ProductsSuccessState extends IProductsState {
  final List<ProductEntity> products;

  const ProductsSuccessState({required this.products});

  @override
  ProductsSuccessState copyWith({final List<ProductEntity>? products}) {
    return ProductsSuccessState(products: products ?? this.products);
  }

  @override
  List<Object?> get props => [products];
}

class ProductsRefreshingState extends IProductsState {
  @override
  IProductsState copyWith() {
    return this;
  }
}


class ProductsFailureState extends IProductsState {
  final Failure failure;

  const ProductsFailureState({required this.failure});

  @override
  IProductsState copyWith() {
    return this;
  }

  @override
  List<Object?> get props => [failure];
}