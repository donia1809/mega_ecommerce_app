import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/toggle_favorite_entity.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/use_case/toggle_favourite_use_case.dart';

part 'toggle_favourite_state.dart';

class ToggleFavoriteCubit extends Cubit<IToggleFavoriteState> {
  final ToggleFavoriteUseCase toggleFavouriteUseCase;
  bool _isFavorite = false;

  ToggleFavoriteCubit(this.toggleFavouriteUseCase)
    : super(ToggleFavoriteInitialState());

  void toggleFavourite(String id) async {
    emit(ToggleFavoriteLoadingState(isFavorite: _isFavorite));
    final result = await toggleFavouriteUseCase(id);
    result.fold(
      (failure) => emit(
        ToggleFavoriteFailureState(failure: failure, isFavorite: _isFavorite),
      ),
      (result) {
        _isFavorite = !_isFavorite;
        emit(
          ToggleFavoriteSuccessState(
            toggleFavorite: result,
            isFavorite: _isFavorite,
          ),
        );
      },
    );
  }
  @override
  void emit(IToggleFavoriteState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
