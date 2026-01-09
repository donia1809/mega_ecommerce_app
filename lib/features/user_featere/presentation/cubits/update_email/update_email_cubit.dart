import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_email_ue_case.dart';

part 'update_email_state.dart';

class UpdateEmailCubit extends Cubit<IUpdateEmailState> {
  final UpdateEmailUseCase _updateEmailUseCase;
  UpdateEmailCubit(this._updateEmailUseCase) : super(UpdateEmailInitialEmail());
  Future<void> updateEmail(UpdateEmailParams params) async {
    emit(UpdateEmailLoadingState());
    final result = await _updateEmailUseCase(params);
    result.fold(
      (failure) => emit(UpdateEmailFailureState(failure: failure)),
      (updateEmail) => emit(UpdateEmailSuccessState(updateEmail: updateEmail)),
    );
  }
}
