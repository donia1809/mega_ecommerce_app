part of 'product_by_id_cubit.dart';

sealed class IProductByIdState extends Equatable {
  const IProductByIdState();

  @override
  List<Object?> get props => [];
}

class ProductByIdInitialState extends IProductByIdState {}

class ProductByIdFailureState extends IProductByIdState {
  final Failure failure;

  const ProductByIdFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class ProductByIdLoadingState extends IProductByIdState {}

class ProductByIdSuccessState extends IProductByIdState {
  final ProductEntity getProductById;

  const ProductByIdSuccessState({required this.getProductById});

  @override
  List<Object?> get props => [getProductById];
}
