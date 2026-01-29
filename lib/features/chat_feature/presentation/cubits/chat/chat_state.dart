part of 'chat_cubit.dart';

sealed class IChatState extends Equatable {
  const IChatState();

  @override
  List<Object?> get props => [];
}

final class ChatInitialState extends IChatState {}

final class ChatLoadingState extends IChatState {}

final class ChatSuccessState extends IChatState {
  final List<ChatEntity> chat;

  const ChatSuccessState({required this.chat});
  @override
  List<Object?> get props => [chat];
}

final class ChatFailureState extends IChatState {
  final Failure failure;

  const ChatFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
