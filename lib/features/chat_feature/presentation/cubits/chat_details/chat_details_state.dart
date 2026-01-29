part of 'chat_details_cubit.dart';

sealed class IChatDetailsState extends Equatable {
  const IChatDetailsState();

  @override
  List<Object?> get props => [];
}

final class ChatDetailsInitialState extends IChatDetailsState {}

final class ChatDetailsLoadingState extends IChatDetailsState {}

final class ChatDetailsSuccessState extends IChatDetailsState {
  final ChatDetailsEntity chatDetails;
  const ChatDetailsSuccessState({required this.chatDetails});

  ChatDetailsSuccessState copyWith({ChatDetailsEntity? chatDetails}) {
    return ChatDetailsSuccessState(
      chatDetails: chatDetails ?? this.chatDetails,
    );
  }

  @override
  List<Object?> get props => [chatDetails];
}

final class ChatDetailsFailureState extends IChatDetailsState {
  final Failure failure;
  const ChatDetailsFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
