import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/verify_email_update_use_case.dart';

part 'verify_email_update_state.dart';

class VerifyEmailUpdateCubit extends Cubit<IVerifyEmailUpdateState> {
  final VerifyEmailUpdateUseCase _verifyEmailUpdateUseCase;
  VerifyEmailUpdateCubit(this._verifyEmailUpdateUseCase)
    : super(IVerifyEmailUpdateInitialState());
  Future<void> verifyEmailUpdate(VerifyEmailUpdateParams params) async {
    emit(VerifyEmailUpdateLoadingState());
    final result = await _verifyEmailUpdateUseCase(params);
    result.fold(
      (failure) => emit(VerifyEmailUpdateFailureState(failure: failure)),
      (verifyEmail) => emit(VerifyEmailUpdateSuccessState(verifyEmail: verifyEmail)),
    );
  }
}
