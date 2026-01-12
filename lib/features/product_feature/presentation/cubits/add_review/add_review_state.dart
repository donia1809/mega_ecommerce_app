part of 'add_review_cubit.dart';

sealed class IAddReviewState extends Equatable {
  const IAddReviewState();

  @override
  List<Object?> get props => [];
}

final class AddReviewInitialState extends IAddReviewState {}

class AddReviewLoadingState extends IAddReviewState {}

class AddReviewFailureState extends IAddReviewState {
  final Failure failure;

  const AddReviewFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class AddReviewSuccessState extends IAddReviewState {
  final AddReviewEntity addReview;

  const AddReviewSuccessState({required this.addReview});

  @override
  List<Object?> get props => [addReview];
}