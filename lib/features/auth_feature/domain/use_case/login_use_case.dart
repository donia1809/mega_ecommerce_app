import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call(LoginParams params) {
    return authRepo.login(params);
  }
}

class LoginParams {

  final String email;
  final String password;


  const LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> get toMap {
    return {
      'email':email,
      'password':password,
    };
  }
}
