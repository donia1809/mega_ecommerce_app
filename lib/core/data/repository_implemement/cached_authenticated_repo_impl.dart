import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/data/data_source/cached_authenticated_data_source.dart';
import 'package:mega_ecommerce_app/core/data/models/cached_user_model.dart';
import 'package:mega_ecommerce_app/core/data/models/token_model.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/token_entity.dart';
import 'package:mega_ecommerce_app/core/domain/repository/cached_authenticated_repo.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

class CachedAuthenticatedRepoImpl implements CachedAuthenticatedRepo {
  final CachedAuthenticatedDataSource cachedAuthenticatedDataSource;

  CachedAuthenticatedRepoImpl({required this.cachedAuthenticatedDataSource});

  @override
  Future<Either<Failure, CachedUserEntity>> saveUser(
    final CachedUserEntity user,
  ) async {
    try {
      await cachedAuthenticatedDataSource.saveUser(
        CachedUserModel.fromEntity(user),
      );
      debugPrint('[Saved Cached User] ::: $user');

      return Right(user);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, CachedUserEntity?>> getUser() async {
    try {
      final user = await cachedAuthenticatedDataSource.getUser();
      debugPrint('[Get Cached User] ::: $user');
      return Right(user);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser() async {
    try {
      await cachedAuthenticatedDataSource.deleteUser();
      return const Right(unit);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, TokenEntity>> saveToken(TokenEntity token) async {
    try {
      final tokenModel = TokenModel.fromEntity(token);
      await cachedAuthenticatedDataSource.saveToken(tokenModel);
      debugPrint('[Saved Cached Token] ::: ${tokenModel.token}');

      return Right(token);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, TokenEntity?>> getToken() async {
    try {
      final token = await cachedAuthenticatedDataSource.getToken();
      debugPrint('[Get Cached Token] ::: ${token?.token}');
      return Right(token);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteToken() async {
    try {
      await cachedAuthenticatedDataSource.deleteToken();
      return const Right(unit);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
