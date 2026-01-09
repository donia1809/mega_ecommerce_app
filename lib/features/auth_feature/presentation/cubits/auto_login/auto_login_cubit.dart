import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/get_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/get_user_use_case.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<IAutoLogintState> {
  final GetTokenUseCase _getTokenUseCase;
  final GetUserUseCase _getUserUseCase;
  
  AutoLoginCubit(
    this._getTokenUseCase,
    this._getUserUseCase,
  ) : super(AutoLoginInitial());

  Future<void> autoLogin() async {
    final savedToken = await _getTokenUseCase();
    final savedUser = await _getUserUseCase();
    savedToken.fold(
      (failure) => emit(AppUnAuthenticatedState(failure: failure)),
      (_) async {
        savedUser.fold(
          (failure) => emit(AppUnAuthenticatedState(failure: failure)),
          (_) => emit(AppAuthenticatedState()),
        );
      },
    );
  }
}
