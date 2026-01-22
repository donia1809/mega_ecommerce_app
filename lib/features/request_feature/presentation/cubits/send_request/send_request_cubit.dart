import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/use_cases/send_request_use_case.dart';

part 'send_request_state.dart';

class SendRequestCubit extends Cubit<ISendRequestState> {
  final SendRequestUseCase _sendRequestUseCase;
  SendRequestCubit(this._sendRequestUseCase) : super(SendRequestInitialState());

  Future<void> sendRequest(RequestParams params) async {
    emit(SendRequestLoadingState());
    final result = await _sendRequestUseCase(params);
    result.fold(
      (failure) => emit(SendRequestFailureState(failure: failure)),
      (_) => emit(SendRequestSuccessState()),
    );
  }
}
