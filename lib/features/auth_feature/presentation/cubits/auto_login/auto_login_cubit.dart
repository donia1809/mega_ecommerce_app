import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/get_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/get_user_use_case.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<IAutoLogintState> {
  final GetTokenUseCase _getTokenUseCase;
  final GetUserUseCase _getUserUseCase;

  AutoLoginCubit(this._getTokenUseCase, this._getUserUseCase)
    : super(AutoLoginInitial());

  Future<void> autoLogin() async {
    emit(AutoLoginInitial());
    final bool isAlreadyLogin = await _isUserAlreadyLogin;
    if (isAlreadyLogin) {
      final userData = await _getUserUseCase();
      userData.fold(
        (l) {
          emit(AppUnAuthenticatedState());
        },
        (data) {
          if (data != null) {
            emit(AppAuthenticatedState(user: data));
          } else {
            emit(AppUnAuthenticatedState());
          }
        },
      );
    } else {
      emit(AppUnAuthenticatedState());
    }
  }

  Future<bool> get _isUserAlreadyLogin async {
    try {
      final savedToken = await _getTokenUseCase();
      final savedUser = await _getUserUseCase();
      bool isLogin = false;
      savedToken.fold(
        (l) {
          isLogin = false;
        },
        (r) {
          isLogin = r != null;
        },
      );
      savedUser.fold(
        (l) {
          isLogin = false;
        },
        (r) {
          isLogin = r != null;
        },
      );
      return isLogin;
    } catch (_) {
      return false;
    }
  }

  @override
  void emit(IAutoLogintState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
