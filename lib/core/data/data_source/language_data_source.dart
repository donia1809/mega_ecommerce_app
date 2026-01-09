import 'package:mega_ecommerce_app/core/domain/entity/language/app_language_enum.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

const String _languageKey = 'app_lang_cache_key';

abstract class LanguageDataSource {
  Future<AppLanguageEnum> cachedLanguage(AppLanguageEnum appLang);
  Future<AppLanguageEnum> getCachedLanguage();
  Future<void> clearChachedLanguage();
}

class LanguageDataSourceImpl implements LanguageDataSource {
  final SharedPreferences sharedPreferences;

  LanguageDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AppLanguageEnum> cachedLanguage(AppLanguageEnum appLang) async {
    try {
      await sharedPreferences.setString(_languageKey, appLang.languageCode);
      return appLang;
    } catch (e) {
      
      throw CacheException();
    }
  }

  @override
  Future<void> clearChachedLanguage() async {
    try {
      await sharedPreferences.remove(_languageKey);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<AppLanguageEnum> getCachedLanguage() async {
    try {
      final cachedLang = sharedPreferences.getString(_languageKey);
      if (cachedLang != null) {
        final appLang = AppLanguageEnum.fromLanguageCode(cachedLang);
        return appLang;
      } else {
        return _getDefaultLanguage;
      }
    } catch (e) {
      throw CacheException();
    }
  }

  AppLanguageEnum get _getDefaultLanguage {
    final deviceLanguageCode =
        ui.PlatformDispatcher.instance.locale.languageCode;
    return AppLanguageEnum.fromLanguageCode(deviceLanguageCode);
  }
}
