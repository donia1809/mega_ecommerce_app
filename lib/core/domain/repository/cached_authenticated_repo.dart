import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/token_entity.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart' show Failure;

abstract class CachedAuthenticatedRepo 
{

//save, get, delete user
Future<Either<Failure, CachedUserEntity>> saveUser(CachedUserEntity user);
Future<Either<Failure, CachedUserEntity?>> getUser();
Future<Either<Failure, Unit>> deleteUser();

//save, get, delete token
Future<Either<Failure, TokenEntity>> saveToken(TokenEntity token);
Future<Either<Failure, TokenEntity?>> getToken();
Future<Either<Failure, Unit>> deleteToken();

}
