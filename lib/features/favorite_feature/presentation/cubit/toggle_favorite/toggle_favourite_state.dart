part of 'toggle_favourite_cubit.dart';

sealed class IToggleFavoriteState extends Equatable {
  const IToggleFavoriteState();

  @override
  List<Object?> get props => [];
}

final class ToggleFavoriteInitialState extends IToggleFavoriteState {
  const ToggleFavoriteInitialState();
}

class ToggleFavoriteLoadingState extends IToggleFavoriteState {
  final bool isFavorite;

  const ToggleFavoriteLoadingState({required this.isFavorite});
}

class ToggleFavoriteFailureState extends IToggleFavoriteState {
  final Failure failure;
  final bool isFavorite;

  const ToggleFavoriteFailureState({
    required this.failure,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [failure, isFavorite];
}

class ToggleFavoriteSuccessState extends IToggleFavoriteState {
  final ToggleFavoriteEntity toggleFavorite;
  final bool isFavorite;

  const ToggleFavoriteSuccessState({
    required this.toggleFavorite,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [toggleFavorite, isFavorite];
}
