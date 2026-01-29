import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String id;
  final String conversationId;
  final MessageSenderEntity sender;
  final String text;
  final List<dynamic> media;
  final String status;
  final List<dynamic> readBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isMine;

  const MessageEntity({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.text,
    required this.media,
    required this.status,
    required this.readBy,
    required this.createdAt,
    required this.updatedAt,
    required this.isMine,
  });

  @override
  List<Object?> get props => [
        id,
        conversationId,
        sender,
        text,
        media,
        status,
        readBy,
        createdAt,
        updatedAt,
        isMine,
      ];
}


class MessageSenderEntity extends Equatable {
  final String id;
  final String name;
  final String avatar;

  const MessageSenderEntity({
    required this.id,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, name, avatar];
}