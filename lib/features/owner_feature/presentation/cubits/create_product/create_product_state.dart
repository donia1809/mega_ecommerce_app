part of 'create_product_cubit.dart';

sealed class ICreateProductState extends Equatable {
  const ICreateProductState();

  @override
  List<Object?> get props => [];
}

final class CreateProductInitialState extends ICreateProductState {}

final class CreateProductLoadingState extends ICreateProductState {}

final class CreateProductSuccessState extends ICreateProductState {
}

final class CreateProductFailureState extends ICreateProductState {
  final Failure failure;

  const CreateProductFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];

}
