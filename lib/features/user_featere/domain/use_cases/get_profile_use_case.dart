import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';

class GetUserProfileUseCase {
  final ProfileRepo userRepo;

  GetUserProfileUseCase({required this.userRepo});

  Future<Either<Failure, UserProfileEntity>> call() {
    return userRepo.getProfile();
  }
}
