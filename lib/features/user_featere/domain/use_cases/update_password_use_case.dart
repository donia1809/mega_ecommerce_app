import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';

class UpdatePasswordParams {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  UpdatePasswordParams({required this.oldPassword, required this.newPassword, required this.confirmPassword});
  Map<String, dynamic> get toMap {
    return {'oldPassword': oldPassword, 'newPassword': newPassword, 'confirmPassword':confirmPassword};
  }
}

class UpdatePasswordUseCase {
  final ProfileRepo updatePasswordRepo;

  UpdatePasswordUseCase({required this.updatePasswordRepo});
  Future<Either<Failure, UpdateProfileEntity>> call(UpdatePasswordParams params) {
    return updatePasswordRepo.updatePassword(params);
  }
}
