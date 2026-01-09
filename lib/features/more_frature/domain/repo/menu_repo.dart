import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';

abstract class MenuRepo {
  Future<Either<Failure, MenuEntity>> getTermsAndConditions();
  Future<Either<Failure, MenuEntity>> getPrivacyPolicy();
  Future<Either<Failure, MenuEntity>> getAboutApp();

}
