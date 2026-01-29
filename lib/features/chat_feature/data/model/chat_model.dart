import 'package:mega_ecommerce_app/features/chat_feature/data/model/participants_model.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.id,
    required super.participants,
    required super.count,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    // final data = (json['data'] as List<dynamic>? ?? []).first;
    return ChatModel(
      id: json['_id'] ?? '',
      count: json['count'] ?? 0,
      participants:
          List.from(
            json['participants'] ?? [],
          ).map((e) => ParticipantsModel.fromJson(e)).toList(),
    );
  }
}
