part of 'delete_product_cubit.dart';

sealed class IDeleteProductState extends Equatable {
  const IDeleteProductState();

  @override
  List<Object?> get props => [];
}

final class DeleteProductInitialState extends IDeleteProductState {}

final class DeleteProductLoadingState extends IDeleteProductState {}

final class DeleteProductSuccessState extends IDeleteProductState {}

final class DeleteProductFailureState extends IDeleteProductState {
  final Failure failure;

  const DeleteProductFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
