import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/cubit/language_cubit.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/theme.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/auto_login/auto_login_cubit.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/notification_listner.dart';
import 'package:mega_ecommerce_app/features/on_boarding_screen.dart';
import 'package:mega_ecommerce_app/home.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MegaEcommerceApp extends StatelessWidget {
  const MegaEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      breakpointsLandscape: const [
        Breakpoint(start: 0, end: 1023, name: MOBILE),
        Breakpoint(start: 1024, end: 1599, name: TABLET),
        Breakpoint(start: 1600, end: double.infinity, name: DESKTOP),
      ],

      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<AppLanguageCubit>()..getSavedLanguage(),
          ),
          BlocProvider(create: (_) => sl<AutoLoginCubit>()..autoLogin()),
        ],
        child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
          builder: (context, state) {
            return NotificationListenerWidget(
              child: MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Mega',
                locale: state.language.getLocal,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: AppTheme.lightTheme,
                onGenerateRoute: AppRoutes.generateRoutes,
                initialRoute: AppRoutes.appStart,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppStart extends StatelessWidget {
  final Widget? child;
  const AppStart({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: BlocConsumer<AutoLoginCubit, IAutoLogintState>(
        listener: (context, state) {
          // if (state is AppAuthenticatedState) {
          //   context.remove();
          //   context.navigateTo(AppRoutes.home);
          // } else if (state is AppUnAuthenticatedState) {
          //   context.remove();
          //   context.navigateTo(AppRoutes.loginScreen);
          // } else if (state is AppGuestState) {
          //   context.remove();
          //   context.navigateTo(AppRoutes.loginScreen);
          // }
        },
        builder: (context, state) {
          switch (state) {
            case AutoLoginInitial():
              return SizedBox();
            case AppUnAuthenticatedState():
              return OnBoardingScreen();
            case AppAuthenticatedState():
            case AppGuestState():
              return const Home();
          }
        },
      ),
    );
  }
}