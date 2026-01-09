import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';

class VerifyAccountUseCase {
  final AuthRepo authRepo;

  VerifyAccountUseCase({required this.authRepo});

  Future<Either<Failure, Unit>> call(VerifyAccountParams params) {
    return authRepo.verifyAccount(params);
  }
}

class VerifyAccountParams {
  final String otp;
  VerifyAccountParams({ required this.otp});
  Map<String, dynamic> get toMap {
    return {
      'code':otp,
    };
  }
}
