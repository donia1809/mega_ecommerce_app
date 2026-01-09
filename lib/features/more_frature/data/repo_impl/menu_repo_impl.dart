import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/more_frature/data/data_source/menu_data_source.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/repo/menu_repo.dart';

class MenuRepoImpl implements MenuRepo {
  final MenuDataSource menuDataSource;

  MenuRepoImpl({required this.menuDataSource});

  @override
  Future<Either<Failure, MenuEntity>> getTermsAndConditions() async {
    try {
      final terms = await menuDataSource.getTermsAndConditions();
      return Right(terms);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, MenuEntity>> getPrivacyPolicy() async {
    try {
      final policy = await menuDataSource.getPrivacyPolicy();
      return Right(policy);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
  
  @override
  Future<Either<Failure, MenuEntity>> getAboutApp() async {
  try {
      final about = await menuDataSource.getAboutApp();
      return Right(about);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
