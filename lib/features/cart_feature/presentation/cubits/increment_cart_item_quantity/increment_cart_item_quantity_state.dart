part of 'increment_cart_item_quantity_cubit.dart';

sealed class IIncrementCartItemQuantityState extends Equatable {
  const IIncrementCartItemQuantityState();

  @override
  List<Object?> get props => [];
}

final class IncrementCartItemQuantityInitialState
    extends IIncrementCartItemQuantityState {}

final class IncrementCartItemQuantityLoadingState
    extends IIncrementCartItemQuantityState {}

final class IncrementCartItemQuantitySuccessState
    extends IIncrementCartItemQuantityState {}

final class IncrementCartItemQuantityFailureState
    extends IIncrementCartItemQuantityState {
  final Failure failure;

  const IncrementCartItemQuantityFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
