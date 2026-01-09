import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';

class VerifyEmailUpdateParams {
  final String code;

  VerifyEmailUpdateParams({required this.code});
  Map<String, dynamic> get toMap {
    return {'code': code};
  }
}

class VerifyEmailUpdateUseCase {
  final ProfileRepo verifyEmailRepo;

  VerifyEmailUpdateUseCase({required this.verifyEmailRepo});
  Future<Either<Failure, UpdateProfileEntity>> call(VerifyEmailUpdateParams params) {
    return verifyEmailRepo.verifyEmailUpdate(params);
  }
}
