import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/forget_password_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<IForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordCubit(this._forgetPasswordUseCase)
    : super(ForgetPasswordInitialState());

  Future<void> forgetPassword(ForgetPasswordParams params) async {
    emit(ForgetPasswordLoadingState());
    final result = await _forgetPasswordUseCase(params);
    result.fold(
      (failure) => emit(ForgetPasswordFailureState(failure: failure)),
      (_) => emit(ForgetPasswordSuccessState()),
    );
  }
}
