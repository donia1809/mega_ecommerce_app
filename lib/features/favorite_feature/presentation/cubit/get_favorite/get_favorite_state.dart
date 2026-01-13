part of 'get_favorite_cubit.dart';

sealed class IGetFavoriteState extends Equatable {
  const IGetFavoriteState();
  IGetFavoriteState copyWith();

  @override
  List<Object?> get props => [];
}

final class GetFavoriteInitialState extends IGetFavoriteState {
  @override
  IGetFavoriteState copyWith() {
    return this;
  }
}

final class GetFavoriteLoadingState extends IGetFavoriteState {
  @override
  IGetFavoriteState copyWith() {
    return this;
  }
}

final class GetFavoriteSeccessState extends IGetFavoriteState {
  final List<ProductEntity> products;

  const GetFavoriteSeccessState({required this.products});

  @override
  GetFavoriteSeccessState copyWith({final List<ProductEntity>? products}) {
    return GetFavoriteSeccessState(products: products ?? this.products);
  }

  @override
  List<Object?> get props => [products];
}

final class GetFavoriteFailureState extends IGetFavoriteState {
  final Failure failure;

  const GetFavoriteFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
  
  @override
  IGetFavoriteState copyWith() {
    return this;
  }
}
