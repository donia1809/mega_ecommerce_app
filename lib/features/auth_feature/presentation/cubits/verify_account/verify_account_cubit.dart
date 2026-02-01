import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/save_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/save_user_use_case.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/verification_code_enum.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/verify_account_use_case.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<IVerifyAccountState> {
  final VerifyAccountUseCase _verifyAccountUseCase;

  VerifyAccountCubit(
    this._verifyAccountUseCase,
    SaveTokenUseCase saveTokenUseCase,
    SaveUserUseCase saveUserUseCase,
  ) : super(VerifyAccountInitialState());
  void verifyAccount(VerifyAccountParams params) async {
    emit(VerifyAccountLoadingState());
    final user = await _verifyAccountUseCase(params);
    user.fold(
      (failure) {
        if (failure.message.toLowerCase().contains('already verified')) {
        emit(VerifyAccountSuccessState(params.verificationCode));
      } else {
        emit(VerifyAccountFailureState(failure: failure));
      }
      },
      (auth) async {
        emit(VerifyAccountSuccessState(params.verificationCode));
      },
    );
  }

  @override
  void emit(IVerifyAccountState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
