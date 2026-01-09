import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_password_use_case.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<IUpdatePasswordState> {
  final UpdatePasswordUseCase _updatePasswordUseCase;
  UpdatePasswordCubit(this._updatePasswordUseCase) : super(UpdatePasswordInitialState());
  Future<void> updatePassword(UpdatePasswordParams params) async {
    emit(UpdatePasswordLoadingState());
    final result = await _updatePasswordUseCase(params);
    result.fold(
      (failure) => emit(UpdatePasswordFailureState(failure: failure)),
      (updatePassword) => emit(UpdatePasswordSuccessState(updatePassword: updatePassword)),
    );
  }
}
