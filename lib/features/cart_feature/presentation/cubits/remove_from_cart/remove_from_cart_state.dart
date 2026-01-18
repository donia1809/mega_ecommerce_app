part of 'remove_from_cart_cubit.dart';

sealed class IRemoveFromCartState extends Equatable {
  const IRemoveFromCartState();

  @override
  List<Object?> get props => [];
}

final class RemoveFromCartInitialState extends IRemoveFromCartState {}

final class RemoveFromCartLoadingState extends IRemoveFromCartState {}

final class RemoveFromCartSuccessState extends IRemoveFromCartState {}

final class RemoveFromCartFailursState extends IRemoveFromCartState {
  final Failure failure;

  const RemoveFromCartFailursState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

