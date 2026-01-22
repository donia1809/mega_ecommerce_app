import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/repository/cached_authenticated_repo.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class SaveUserUseCase {
  final CachedAuthenticatedRepo cachedAuthenticatedRepo;

  SaveUserUseCase({required this.cachedAuthenticatedRepo});
  Future<Either<Failure, CachedUserEntity>> call(CachedUserEntity user) async {
    return await cachedAuthenticatedRepo.saveUser(user);
  }
}

