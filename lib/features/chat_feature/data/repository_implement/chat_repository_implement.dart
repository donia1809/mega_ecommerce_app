import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/data_source/chat_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/repository/chat_repository.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/send_message_use_case.dart';

class ChatRepositoryImplement implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImplement({required this.chatRemoteDataSource});
  @override
  Future<Either<Failure, List<ChatEntity>>> getAllChats() async {
    try {
      final result = await chatRemoteDataSource.gatAllChats();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, ChatDetailsEntity>> getChatDetails(
    String userId,
  ) async {
    try {
      final result = await chatRemoteDataSource.getChatDetails(userId);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage(
    SendMessageParams params,
  ) async {
    try {
      final result = await chatRemoteDataSource.sendMessage(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
