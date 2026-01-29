import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/model/chat_details_model.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/model/chat_model.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/model/message_model.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/send_message_use_case.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatModel>> gatAllChats();
  Future<ChatDetailsModel> getChatDetails(String userId);
  Future<MessageModel> sendMessage(SendMessageParams params);
}

class ChatRemoteDataSourceImplement implements ChatRemoteDataSource {
  final ApiHelper apiHelper;

  ChatRemoteDataSourceImplement({required this.apiHelper});
  @override
  Future<List<ChatModel>> gatAllChats() async {
    final response = await apiHelper.getRequest(endPoint: '/api/chat');
    final List dataJson = response['data'] as List<dynamic>? ?? [];

    final List<ChatModel> chats =
        dataJson.map((e) => ChatModel.fromJson(e)).toList();

    return chats;
  }

  @override
  Future<ChatDetailsModel> getChatDetails(String userId) async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/chat/user/$userId',
    );
    return ChatDetailsModel.fromJson(response);
  }

  @override
  Future<MessageModel> sendMessage(SendMessageParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/chat/${params.conversationId}/send',
      headers: {'Content-Type': 'multipart/form-data','accept': '*/*'},
      body: params.toMap,
      
      isFormData: true,
    );
    return MessageModel.fromJson(response['data']);
  }
}
