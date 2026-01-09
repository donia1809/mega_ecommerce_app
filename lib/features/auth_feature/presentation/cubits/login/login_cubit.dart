import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/token_entity.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/save_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/save_user_use_case.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/login_use_case.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<ILoginState> {
  final LoginUseCase _loginUseCase;
  final SaveTokenUseCase _saveTokenUseCase;
  final SaveUserUseCase _saveUserUseCase;
  LoginCubit(this._loginUseCase, this._saveTokenUseCase, this._saveUserUseCase)
    : super(LoginInitalState());

  Future<void> login(LoginParams params) async {
    emit(LoginLoadingState());
    final user = await _loginUseCase(params);
    user.fold(
      (failure) => emit(LoginFailureState(failure: failure)),
      (auth) async {
      final cachedUser = CachedUserEntity(
        id: auth.id,
        name: auth.name,
        email: auth.email,
        isVerified: auth.isVerified,
      );

      final token = TokenEntity(token: auth.token);

      await _saveUserUseCase(cachedUser);
      await _saveTokenUseCase(token);

      emit(LoginSuccessState(data: auth));
    });
    // emit(LoginInitalState());
  }
}
