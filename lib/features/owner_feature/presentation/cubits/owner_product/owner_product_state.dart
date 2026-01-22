part of 'owner_product_cubit.dart';

sealed class IOwnerProductState extends Equatable {
  const IOwnerProductState();

  @override
  List<Object?> get props => [];
}

final class OwnerProductInitialstate extends IOwnerProductState {}

final class OwnerProductLoadingState extends IOwnerProductState {}

final class OwnerProductSeccessState extends IOwnerProductState {
  final List<ProductEntity> ownerProduct;

  const OwnerProductSeccessState({required this.ownerProduct});

  @override
  List<Object?> get props => [ownerProduct];
}

final class OwnerProductFailureState extends IOwnerProductState {
  final Failure failure;

  const OwnerProductFailureState({required this.failure});
  
  @override
  List<Object?> get props => [failure];
}
