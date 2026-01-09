import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/token_entity.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/save_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/save_user_use_case.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/signup_use_cases.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<ISignupState> {
  final SignupUseCase _signupUseCase;
  final SaveTokenUseCase _saveTokenUseCase;
  final SaveUserUseCase _saveUserUseCase;
  SignupCubit(
    this._signupUseCase,
    this._saveTokenUseCase,
    this._saveUserUseCase,
  ) : super(SignupInitialState());
  Future<void> signup(SignupParams params) async {
    emit(SignupLoadingState());
    final user = await _signupUseCase(params);
    user.fold((failure) => emit(SignupFailureState(failure: failure)),
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
      emit(SignupSuccessState(data: auth));
    });
    // emit(SignupInitialState());
  }
}
