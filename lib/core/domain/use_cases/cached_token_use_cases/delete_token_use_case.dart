import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/repository/cached_authenticated_repo.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class DeleteTokenUseCase {
  final CachedAuthenticatedRepo cachedAuthenticatedRepo;

  DeleteTokenUseCase({required this.cachedAuthenticatedRepo});
  Future<Either<Failure, Unit>> call() async {
    return await cachedAuthenticatedRepo.deleteToken();
  }
}