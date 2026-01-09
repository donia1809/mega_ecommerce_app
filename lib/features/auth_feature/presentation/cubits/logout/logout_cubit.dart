import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/log_out_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<ILogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutCubit(this._logoutUseCase)
      : super(const LogoutInitialState());

  Future<void> logout() async {
    emit(LogoutLoadingState());

    final result = await _logoutUseCase();

    result.fold(
      (failure) => emit(LogoutFailureState(failure: failure)),
      (_) => emit(const LogoutSuccessState()),
    );
  }
}


