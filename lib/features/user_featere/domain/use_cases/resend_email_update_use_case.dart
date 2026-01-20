import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';

class ResendEmailUpdateUseCase {
  final ProfileRepo repo;

  ResendEmailUpdateUseCase({required this.repo});
  Future<Either<Failure, UpdateProfileEntity>> call() {
    return repo.resendEmailUpdateCode();
  }
}
