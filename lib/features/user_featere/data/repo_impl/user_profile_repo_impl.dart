import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/data/data_source/user_profile_data_sorce.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_email_ue_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_password_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_profile_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/verify_email_update_use_case.dart';

class UserProfileRepoImpl implements ProfileRepo {
  final UserProfileDataSource userProfileRemoteDataSource;

  UserProfileRepoImpl({required this.userProfileRemoteDataSource});

  @override
  Future<Either<Failure, UserProfileEntity>> getProfile() async {
    try {
      final result = await userProfileRemoteDataSource.getProfile();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final result = await userProfileRemoteDataSource.updateProfile(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> updateEmail(
    UpdateEmailParams params,
  ) async {
    try {
      final result = await userProfileRemoteDataSource.updateEmail(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> verifyEmailUpdate(VerifyEmailUpdateParams params) async {
    try {
      final result = await userProfileRemoteDataSource.veriftEmailUpdate(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> updatePassword(UpdatePasswordParams params) async {
    try {
      final result = await userProfileRemoteDataSource.updatePassword(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
  
  @override
  Future<Either<Failure, UpdateProfileEntity>> resendEmailUpdateCode() async {
    try {
      final result = await userProfileRemoteDataSource.resendEmailUpdateCode();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
