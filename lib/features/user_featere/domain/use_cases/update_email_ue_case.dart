import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';

class UpdateEmailParams {
  final String newEmail;

  UpdateEmailParams({required this.newEmail});
  Map<String, dynamic> get toMap {
    return {'newEmail': newEmail};
  }
}

class UpdateEmailUseCase {
  final ProfileRepo updateEmailRepo;

  UpdateEmailUseCase({required this.updateEmailRepo});
  Future<Either<Failure, UpdateProfileEntity>> call(UpdateEmailParams params) {
    return updateEmailRepo.updateEmail(params);
  }
}
