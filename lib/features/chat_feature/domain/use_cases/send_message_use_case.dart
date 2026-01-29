import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/repository/chat_repository.dart';

class SendMessageParams {
  final String conversationId;
  final String text;
  final List<XFile>? media;

  SendMessageParams({
    required this.conversationId,
    required this.text,
    this.media,
  });

  Map<String, dynamic> get toMap {
    // final image = [];

    // if (media != null && media!.isNotEmpty) {
    //   for (int i = 0; i < media!.length; i++) {
    //     final _tempFile = MultipartFile.fromFileSync(media![i].path);
    //     image.add(_tempFile);
    //   }
    // }
    final image =
        media?.map(
          (e) => MultipartFile.fromFileSync(e.path)
        ).toList();

    return {'conversationId': conversationId, 'text': text, 'media': image};
  }
}

class SendMessageUseCase {
  final ChatRepository chatRepo;

  SendMessageUseCase({required this.chatRepo});
  Future<Either<Failure, MessageEntity>> call(SendMessageParams params) {
    return chatRepo.sendMessage(params);
  }
}
