import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/data/data_source/auth_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/forget_password_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/login_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/signup_use_cases.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/verify_account_use_case.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams params) async {
    try {
      final user = await authRemoteDataSource.login(params);
      return Right(user);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUp(SignupParams params) async {
    try {
      final user = await authRemoteDataSource.signUp(params);
      return Right(user);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyAccount(
    VerifyAccountParams params,
  ) async {
    try {
      await authRemoteDataSource.verifyAccount(params);
      return Right(unit);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await authRemoteDataSource.logout();

      return Right(unit);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(ForgetPasswordParams params) async {
    try {
      await authRemoteDataSource.forgetPassword(params);

      return Right(unit);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
