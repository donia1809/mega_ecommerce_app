import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/favourite_entity.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/domain/use_case/toggle_favourite_use_case.dart';

part 'toggle_favourite_state.dart';

class ToggleFavouriteCubit extends Cubit<IToggleFavouriteState> {
  final ToggleFavouriteUseCase toggleFavouriteUseCase;
   bool _isFavorite = false;

  ToggleFavouriteCubit(this.toggleFavouriteUseCase)
    : super(ToggleFavouriteInitialState());

  Future<void> toggleFavourite(String id) async {
    emit(ToggleFavouriteLoadingState(isFavorite: _isFavorite));
    final result = await toggleFavouriteUseCase(id);
    result.fold(
      (failure) => emit(
        ToggleFavouriteFailureState(failure: failure, isFavorite: _isFavorite),
      ),
      (result) {
        _isFavorite = !_isFavorite;
        emit(
          ToggleFavouriteSuccessState(
            toggleFavorite: result,
            isFavorite: _isFavorite,
          ),
        );
      },
    );
  }
}
