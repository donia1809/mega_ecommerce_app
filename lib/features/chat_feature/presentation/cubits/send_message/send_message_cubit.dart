import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/message_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/send_message_use_case.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<ISendMessageState> {
  final SendMessageUseCase _sendMessageUseCase;
  SendMessageCubit(this._sendMessageUseCase) : super(SendMessageInitialState());

  Future<void> sendMessage(SendMessageParams params) async {
    emit(SendMessageLoading());
    final result = await _sendMessageUseCase(params);
    result.fold(
      (failure) => emit(SendMessageFailure(failure:failure)),
      (message) => emit(SendMessageSuccess(message:message)),
    );
  }

  @override
  void emit(ISendMessageState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
