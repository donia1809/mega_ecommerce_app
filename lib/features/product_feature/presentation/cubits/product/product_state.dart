part of 'product_cubit.dart';

sealed class IProductsState extends Equatable {
  const IProductsState();

  @override
  List<Object?> get props => [];
}

final class ProductsInitialState extends IProductsState {}

class ProductsFailureState extends IProductsState {
  final Failure failure;

  const ProductsFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class ProductsLoadingState extends IProductsState {}

class ProductsSuccessState extends IProductsState {
  final List<ProductsEntity> products;

  const ProductsSuccessState({required this.products});
  @override
  List<Object?> get props => [products];
}

class ProductsRefreshingState extends IProductsState {}
