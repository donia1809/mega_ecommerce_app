import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/participants_entity.dart';

class ChatEntity extends Equatable {
  final String id;
  final List<ParticipantsEntity> participants;
  final int count;

  const ChatEntity({required this.id, required this.participants, required this.count});

  @override
  List<Object?> get props => [id, participants, count];
}
