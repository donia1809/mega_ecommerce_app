import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/participants_entity.dart';

class ParticipantsModel extends ParticipantsEntity {
  const ParticipantsModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
    required super.role,
  });

  factory ParticipantsModel.fromJson(Map<String, dynamic> json) {
    return ParticipantsModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      role: json['role'] ?? '',
    );
  }

}
