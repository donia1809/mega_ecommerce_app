import 'package:mega_ecommerce_app/features/chat_feature/data/model/message_model.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';

class ChatDetailsModel extends ChatDetailsEntity {
  const ChatDetailsModel({
    required super.chatId,
    required super.currentUser,
    required super.otherUser,
    required super.messages,
  });

  factory ChatDetailsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ChatDetailsModel(
      chatId: data['chatId'] ?? '',
      currentUser: UserModel.fromJson(data['currentUser'] ?? {}),
      otherUser: UserModel.fromJson(data['otherUser'] ?? {}),
      messages: List.from(data['messages'] ?? [])
          .map((e) => MessageModel.fromJson(e))
          .toList(),
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}
