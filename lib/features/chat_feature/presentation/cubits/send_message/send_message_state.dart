part of 'send_message_cubit.dart';

sealed class ISendMessageState extends Equatable {
  const ISendMessageState();

  @override
  List<Object?> get props => [];
}

final class SendMessageInitialState extends ISendMessageState {}

class SendMessageLoading extends ISendMessageState {}

class SendMessageSuccess extends ISendMessageState {
  final MessageEntity message;

  const SendMessageSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class SendMessageFailure extends ISendMessageState {
  final Failure failure;

  const SendMessageFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
