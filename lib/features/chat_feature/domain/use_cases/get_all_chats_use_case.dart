import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/repository/chat_repository.dart';

class GetAllChatsUseCase {
  final ChatRepository chatRepo;

  GetAllChatsUseCase({required this.chatRepo});

  Future<Either<Failure, List<ChatEntity>>> call()
  {
    return chatRepo.getAllChats();
  }
}
