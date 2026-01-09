import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/entity/language/app_language_enum.dart';
import 'package:mega_ecommerce_app/core/domain/repository/language_cached_repo.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class GetCachedLanguageUseCase {
  final AppLanguageCachedRepo languageCachedRepo;

  GetCachedLanguageUseCase({required this.languageCachedRepo});

  Future<Either<Failure, AppLanguageEnum>> call() async {
    return await languageCachedRepo.getSavedLanguage();
  }
}
