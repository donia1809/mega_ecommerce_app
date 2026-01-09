import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/data/data_source/language_data_source.dart';
import 'package:mega_ecommerce_app/core/domain/entity/language/app_language_enum.dart';
import 'package:mega_ecommerce_app/core/domain/repository/language_cached_repo.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class AppLanguageCachedRepoImpl implements AppLanguageCachedRepo {
  final LanguageDataSource languageDataSource;

  const AppLanguageCachedRepoImpl({required this.languageDataSource});

  @override
  Future<Either<Failure, void>> clearLanguage() async {
    try {
      await languageDataSource.clearChachedLanguage();
      return const Right(null);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, AppLanguageEnum>> getSavedLanguage() async {
    try {
      final language = await languageDataSource.getCachedLanguage();
      return Right(language);
    } catch(e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, AppLanguageEnum>> saveLanguage(
    AppLanguageEnum appLang,
  ) async {
    try {
      await languageDataSource.cachedLanguage(appLang);
      return Right(appLang);
    } catch(e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
