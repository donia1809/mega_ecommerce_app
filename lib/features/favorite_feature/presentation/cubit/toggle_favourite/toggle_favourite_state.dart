part of 'toggle_favourite_cubit.dart';

sealed class IToggleFavouriteState extends Equatable {
  const IToggleFavouriteState();

  @override
  List<Object?> get props => [];
}

final class ToggleFavouriteInitialState extends IToggleFavouriteState {
  const ToggleFavouriteInitialState();
}

class ToggleFavouriteLoadingState extends IToggleFavouriteState {
  final bool isFavorite;

  const ToggleFavouriteLoadingState({required this.isFavorite});
}

class ToggleFavouriteFailureState extends IToggleFavouriteState {
  final Failure failure;
  final bool isFavorite;

  const ToggleFavouriteFailureState({
    required this.failure,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [failure,isFavorite];
}

class ToggleFavouriteSuccessState extends IToggleFavouriteState {
  final ToggleFavoriteEntity toggleFavorite;
  final bool isFavorite;

  const ToggleFavouriteSuccessState({
    required this.toggleFavorite,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [toggleFavorite,isFavorite];
}
