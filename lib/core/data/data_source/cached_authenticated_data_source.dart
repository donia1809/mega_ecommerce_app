import 'package:flutter/cupertino.dart';
import 'package:mega_ecommerce_app/core/data/models/cached_user_model.dart';
import 'package:mega_ecommerce_app/core/data/models/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions.dart';

const String _kCachedUserKey = 'cached_authenticated_user_key';
const String _kTokenKey = 'cached_authenticated_token_key';

abstract class CachedAuthenticatedDataSource {
  //save, get, delete user
  Future<CachedUserModel> saveUser(CachedUserModel user);
  Future<CachedUserModel?> getUser();
  Future<void> deleteUser();

  //save, get, delete token
  Future<TokenModel> saveToken(TokenModel token);
  Future<TokenModel?> getToken();
  Future<void> deleteToken();
}

class CachedAuthenticatedDataSourceImpl
    implements CachedAuthenticatedDataSource {
  final FlutterSecureStorage _storage;

  CachedAuthenticatedDataSourceImpl({required FlutterSecureStorage storage})
    : _storage = storage;

  // ---------- USER ----------
  @override
  Future<CachedUserModel> saveUser(CachedUserModel user) async {
    try {
      await _storage.write(key: _kCachedUserKey, value: user.toString());
    } catch (_) {
      throw CacheException();
    }
    debugPrint('[Save User] ::: $user');

    return user;
  }

  @override
  Future<CachedUserModel?> getUser() async {
    try {
      final user = await _storage.read(key: _kCachedUserKey);
      debugPrint('[Get User] ::: $user');
      if (user == null || user.isEmpty) {
        return null;
      }
      return CachedUserModel.formJson(user);
    } catch (_) {}

    return null;
  }

  @override
  Future<void> deleteUser() async {
    try {
      await _storage.delete(key: _kCachedUserKey);
      debugPrint('[User deleted]: User deleted success');
    } catch (e) {
      debugPrint('Failed to delete User: $e');
    }
  }

  // ---------- TOKEN ----------
  @override
  Future<TokenModel> saveToken(TokenModel token) async {
    await _storage.write(key: _kTokenKey, value: token.toJson());
    debugPrint('[Save Token] ::: $token');
    return token;
  }

  @override
  Future<TokenModel?> getToken() async {
    try {
      final token = await _storage.read(key: _kTokenKey);
      debugPrint('[Get Token] ::: $token');

      if (token == null) return null;

      return TokenModel.fromJson(token);
    } catch (_) {}
    return null;
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: _kTokenKey);
      debugPrint('[Token deleted]: token deleted success');
    } catch (e) {
      debugPrint('Failed to delete token: $e');
    }
  }
}
