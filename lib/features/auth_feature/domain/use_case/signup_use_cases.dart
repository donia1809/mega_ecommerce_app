import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';

class SignupUseCase {
  final AuthRepo authRepo;

  SignupUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call
   (SignupParams params) {
    return authRepo.signUp(params);
  }
}

class SignupParams {
  final String name;
  final String email;
  final String password;

  SignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> get toMap {
    return {'name': name, 'email': email, 'password': password};
  }
}

