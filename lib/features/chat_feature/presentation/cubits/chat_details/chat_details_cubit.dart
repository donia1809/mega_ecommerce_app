import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/model/message_model.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/get_chat_details_use_case.dart';
import 'package:mega_ecommerce_app/features/chat_feature/services/pusher_service.dart';

part 'chat_details_state.dart';

class ChatDetailsCubit extends Cubit<IChatDetailsState> {
  final GetChatDetailsUseCase _getChatDetailsUseCase;

  ChatDetailsCubit(this._getChatDetailsUseCase)
    : super(ChatDetailsInitialState());

  Future<void> getChatDetails(String userId) async {
    emit(ChatDetailsLoadingState());
    final result = await _getChatDetailsUseCase(userId);
    result.fold((failure) => emit(ChatDetailsFailureState(failure: failure)), (
      chatDetails,
    ) {
      PusherService.subscribeToChat(chatDetails.chatId, newMessageListner);
      emit(ChatDetailsSuccessState(chatDetails: chatDetails));
    });
  }

  void sendNewMessage(MessageEntity newMessage) {
    final state = this.state;
    if (state is ChatDetailsSuccessState) {
      final List<MessageEntity> temp = List.from(state.chatDetails.messages);
      temp.add(newMessage);
      final chat = state.chatDetails.copyWith(newMessage: temp);

      emit(state.copyWith(chatDetails: chat));
    }
  }

  void newMessageListner(dynamic event) {
    print('event:$event');
    final data = jsonDecode(event.data);
    final message = MessageModel.fromJson(data);
    sendNewMessage(message);
  }

  @override
  Future<void> close() {
    final state = this.state;
    if (state is ChatDetailsSuccessState) {
      PusherService.unSubscribe(state.chatDetails.chatId);
    }
    return super.close();
  }

  @override
  void emit(IChatDetailsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
