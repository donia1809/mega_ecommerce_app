import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/entity/language/app_language_enum.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

abstract class AppLanguageCachedRepo {
  Future<Either<Failure, AppLanguageEnum>> saveLanguage( AppLanguageEnum appLang );
  Future<Either<Failure, AppLanguageEnum>> getSavedLanguage();
  Future<Either<Failure, void>> clearLanguage();
}
