import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/delete_token_use_case.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cahed_seer_use_cases/delete_user_use_case.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/repo/auth_repo.dart';

class LogoutUseCase {
  final AuthRepo authRepo;
  final DeleteTokenUseCase deleteTokenUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  LogoutUseCase( {
    required this.deleteTokenUseCase,
    required this.deleteUserUseCase,
   
    required this.authRepo,
  });

  Future<Either<Failure, Unit>> call() async {
    await authRepo.logout();

    await deleteTokenUseCase();
    await deleteUserUseCase();
    return const Right(unit);
  }
}
