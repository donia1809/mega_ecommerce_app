import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/resend_email_update_use_case.dart';

part 'resend_email_update_code_state.dart';

class ResendEmailUpdateCubit extends Cubit<IResendEmailUpdateState> {
  final ResendEmailUpdateUseCase _resendEmailUpdateUseCase;
  ResendEmailUpdateCubit(this._resendEmailUpdateUseCase) : super(ResendEmailUpdateInitialState());
  Future<void> resend0EmailUpdate() async {
    emit(ResendEmailUpdateLoadingState());
    final result = await _resendEmailUpdateUseCase();
    result.fold(
      (failure) => emit(ResendEmailUpdateFailureState(failure: failure)),
      (_) => emit(ResendEmailUpdateSuccessState()),
    );
  }
}
