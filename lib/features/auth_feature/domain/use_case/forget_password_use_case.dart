import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo authRepo;

  ForgetPasswordUseCase({required this.authRepo});

  Future<Either<Failure, Unit>> call(ForgetPasswordParams params) {
    return authRepo.forgetPassword(params);
  }
}

class ForgetPasswordParams {
  final String email;

  ForgetPasswordParams({required this.email});

  Map<String, dynamic> get toMap {
    return {'email': email};
  }
}
