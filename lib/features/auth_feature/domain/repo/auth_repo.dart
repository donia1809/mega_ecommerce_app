
import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/forget_password_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/login_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/signup_use_cases.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/verify_account_use_case.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> login(LoginParams params);

  Future<Either<Failure, AuthEntity>> signUp(SignupParams params);

  Future<Either<Failure, Unit>> forgetPassword(ForgetPasswordParams params);

  Future<Either<Failure, Unit>> verifyAccount(VerifyAccountParams params);

  Future<Either<Failure, Unit>> logout();
}
