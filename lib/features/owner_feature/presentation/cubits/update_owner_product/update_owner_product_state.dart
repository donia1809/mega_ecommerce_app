part of 'update_owner_product_cubit.dart';

sealed class IUpdateOwnerProductState extends Equatable {
  const IUpdateOwnerProductState();

  @override
  List<Object?> get props => [];
}

final class UpdateOwnerProductInitialState extends IUpdateOwnerProductState {}

final class UpdateOwnerProductLoadingState extends IUpdateOwnerProductState {}

final class UpdateOwnerProductSucceessState extends IUpdateOwnerProductState {
  final ProductEntity product;

  const UpdateOwnerProductSucceessState({required this.product});
}

final class UpdateOwnerProductFailurelState extends IUpdateOwnerProductState {
  final Failure failure;

  const UpdateOwnerProductFailurelState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
