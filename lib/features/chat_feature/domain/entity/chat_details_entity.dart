import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';

class ChatDetailsEntity extends Equatable {
  final String chatId;
  final UserEntity currentUser;
  final UserEntity otherUser;
  final List<MessageEntity> messages;

  const ChatDetailsEntity({
    required this.chatId,
    required this.currentUser,
    required this.otherUser,
    required this.messages,
  });

  ChatDetailsEntity copyWith({List<MessageEntity>? newMessage}) {
    return ChatDetailsEntity(
      chatId: chatId,
      currentUser: currentUser,
      otherUser: otherUser,
      messages: newMessage?? messages,
    );
  }

  @override
  List<Object?> get props => [chatId, currentUser, otherUser, messages];
}

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String avatar;

  const UserEntity({
    required this.id,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, name, avatar];
}
