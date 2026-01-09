import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/repository/language_cached_repo.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class ClearLanguageUseCase {
  final AppLanguageCachedRepo languageCachedRepo;

  ClearLanguageUseCase({required this.languageCachedRepo});

  Future<Either<Failure, void>> call() async {
    return await languageCachedRepo.clearLanguage();
  }
}
