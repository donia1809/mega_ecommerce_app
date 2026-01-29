import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/get_all_chats_use_case.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<IChatState> {
  final GetAllChatsUseCase _getAllChatsUseCase;
  ChatCubit(this._getAllChatsUseCase) : super(ChatInitialState());

  Future<void> getAllChats() async {
    emit(ChatLoadingState());
    final result = await _getAllChatsUseCase();
    result.fold(
      (failure) => emit(ChatFailureState(failure: failure)),
      (chat) => emit(ChatSuccessState(chat: chat)),
    );
  }

  @override
  void emit(IChatState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
