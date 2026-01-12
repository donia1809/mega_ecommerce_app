import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/add_review_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/add_review_use_case.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<IAddReviewState> {
  final AddReviewUseCase _addReviewUseCase;
  AddReviewCubit(this._addReviewUseCase) : super(AddReviewInitialState());

  Future<void> addReview(AddReviewParams params, String productId) async {
    emit(AddReviewLoadingState());
    final result = await _addReviewUseCase(params, productId);
    result.fold(
      (failure) => emit(AddReviewFailureState(failure: failure)),
      (addReview) => emit(AddReviewSuccessState(addReview: addReview)),
    );
  }
}
