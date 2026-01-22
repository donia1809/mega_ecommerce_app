part of 'send_request_cubit.dart';

sealed class ISendRequestState extends Equatable {
  const ISendRequestState();

  @override
  List<Object?> get props => [];
}

final class SendRequestInitialState extends ISendRequestState {}

final class SendRequestLoadingState extends ISendRequestState {}

final class SendRequestSuccessState extends ISendRequestState {}

final class SendRequestFailureState extends ISendRequestState {
  final Failure failure;

  const SendRequestFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
