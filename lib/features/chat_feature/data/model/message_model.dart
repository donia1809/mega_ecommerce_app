import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.id,
    required super.conversationId,
    required super.sender,
    required super.text,
    required super.media,
    required super.status,
    required super.readBy,
    required super.createdAt,
    required super.updatedAt,
    required super.isMine,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      conversationId: json['conversation'] is Map
        ? json['conversation']['_id']
        : json['conversation'],
      sender: MessageSenderModel(
        id: json['sender']['_id'],
        name: json['sender']['name'],
        avatar: json['sender']['avatar'] ?? '',
      ),
      text: json['text'],
      media: List.from(json['media'] ?? []),
      status: json['status'],
      readBy: List.from(json['readBy'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isMine: json['isMine'],
    );
  }
}

class MessageSenderModel extends MessageSenderEntity {
  const MessageSenderModel({
    required super.id,
    required super.name,
    required super.avatar,
  });

  factory MessageSenderModel.fromJson(Map<String, dynamic> json) {
    return MessageSenderModel(
      id: json['_id'] ?? json['id'],
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}
