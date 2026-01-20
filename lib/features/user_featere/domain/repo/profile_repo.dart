import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_email_ue_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_password_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_profile_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/verify_email_update_use_case.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserProfileEntity>> getProfile();

  Future<Either<Failure, UserProfileEntity>> updateProfile(
    UpdateProfileParams params,
  );

  Future<Either<Failure, UpdateProfileEntity>> updateEmail(
    UpdateEmailParams params,
  );

  Future<Either<Failure, UpdateProfileEntity>> resendEmailUpdateCode();

  Future<Either<Failure, UpdateProfileEntity>> verifyEmailUpdate(
    VerifyEmailUpdateParams params,
  );  

   Future<Either<Failure, UpdateProfileEntity>> updatePassword(
    UpdatePasswordParams params,
  );  
}
