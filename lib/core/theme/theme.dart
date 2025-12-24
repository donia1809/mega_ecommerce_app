import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';

class AppTheme {
  static Color defaultBackground = AppColors.white;
  static Color lightPrimary = AppColors.primaryColor;
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(color: defaultBackground,centerTitle: true),

    scaffoldBackgroundColor: defaultBackground,

    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.grey,
      labelStyle: AppTextStyles.regular15,
      hintStyle: AppTextStyles.medium15,
      errorStyle: AppTextStyles.bold15.copyWith(color: AppColors.red),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.red),
      ),
    ),

    dividerTheme: DividerThemeData(thickness: 0.5, color: AppColors.grey),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyles.button18,
        foregroundColor: AppColors.white,
        minimumSize: Size(double.infinity, 56),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: AppTextStyles.regular13.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: lightPrimary,
      selectedIconTheme: IconThemeData(color: lightPrimary),
      unselectedIconTheme: IconThemeData(color: AppColors.grey),
      unselectedItemColor: AppColors.grey,
    ),

    listTileTheme: ListTileThemeData(
      selectedColor: AppColors.grey,
      subtitleTextStyle: AppTextStyles.regular15,
      titleTextStyle: AppTextStyles.regular15.copyWith(color: AppColors.black)
    )
  );
}
