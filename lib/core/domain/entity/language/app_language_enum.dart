import 'package:flutter/material.dart';

enum AppLanguageEnum {
  //languageCode
  ar('ar'),
  en('en');

  final String languageCode;
  //primary constructor
  const AppLanguageEnum(this.languageCode);

  //factory named constructor => return primary construcor.values(ar,en),
  //first where دي بتاخد اول قيمة و بتخليها lower case,
  //or else دي بترجعلي ال default lng
  factory AppLanguageEnum.fromLanguageCode(String langCode) {
    return AppLanguageEnum.values.firstWhere(
      (element) => element.languageCode.toLowerCase() == langCode.toLowerCase(),
      orElse: () => AppLanguageEnum.en,
    );
  }

  //getter for language, Local => data type, 
  //getter return Local object معتمد علي ال languageCode بتاع ال enum
  Locale get getLocal {
    return Locale(languageCode);
  }
 
  // دي عشان ال ui
  //بيحول ال enum to string, عشان يظهر في ال ui بال string
  String get getLanguageName {
    switch (this) {
      case AppLanguageEnum.ar:
        return 'العربية';

      case AppLanguageEnum.en:
        return 'English';
    }
  }
}
