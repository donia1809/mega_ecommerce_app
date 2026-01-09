import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/repository/cached_authenticated_repo.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class GetUserUseCase {
  final CachedAuthenticatedRepo cachedAuthenticatedRepo;

  GetUserUseCase({required this.cachedAuthenticatedRepo});
  Future<Either<Failure, CachedUserEntity?>> call() async {
    return await cachedAuthenticatedRepo.getUser();
  }
}
