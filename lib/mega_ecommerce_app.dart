import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/theme.dart';
import 'package:mega_ecommerce_app/features/on_boarding_screen.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class MegaEcommerceApp extends StatelessWidget {
  const MegaEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      home: OnBoardingScreen(),
      onGenerateRoute: AppRoutes.generateRoutes,
      initialRoute: AppRoutes.home,
    );
  }
}
