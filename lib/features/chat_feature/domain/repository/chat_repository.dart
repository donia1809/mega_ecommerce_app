import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/send_message_use_case.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatEntity>>> getAllChats();
  Future<Either<Failure, ChatDetailsEntity>> getChatDetails(String userId);
  Future<Either<Failure, MessageEntity>> sendMessage(SendMessageParams params);
}
