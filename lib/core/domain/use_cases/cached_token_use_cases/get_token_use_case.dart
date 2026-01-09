import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/token_entity.dart';
import 'package:mega_ecommerce_app/core/domain/repository/cached_authenticated_repo.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class GetTokenUseCase {
  final CachedAuthenticatedRepo cachedAuthenticatedRepo;

  GetTokenUseCase({required this.cachedAuthenticatedRepo});
  Future<Either<Failure, TokenEntity?>> call() async {
    return await cachedAuthenticatedRepo.getToken();
  }
}