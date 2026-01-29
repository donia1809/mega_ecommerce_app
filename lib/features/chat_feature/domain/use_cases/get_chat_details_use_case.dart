import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/repository/chat_repository.dart';

class GetChatDetailsUseCase {
  final ChatRepository chatRepo;

  GetChatDetailsUseCase({required this.chatRepo});

  Future<Either<Failure, ChatDetailsEntity>> call(String userId)
  {
    return chatRepo.getChatDetails(userId);
  }
}
