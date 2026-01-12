import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/login/login_screen.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/otp/otp_screen.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/page/add_review_screen.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/pages/reset_pasword_screen.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/pages/reset_email_screen.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/signup/signup_screen.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/page/cart_screen.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/page/all_products_screen.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/page/favourite_screen.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/page/home_screen.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/page/notifications_screen.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/page/product_details_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/about_app_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/change_language_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/more_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/privacy_policy_screen.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/pages/profile_details_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/terms_and_conditions_screen.dart';
import 'package:mega_ecommerce_app/home.dart';
import 'package:mega_ecommerce_app/features/on_boarding_screen.dart';
import 'package:mega_ecommerce_app/mega_ecommerce_app.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppRoutes {
  static const String appStart = '/appStart';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String otpScreen = '/otpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String updateEmailScreen = '/updateEmailScreen';
  static const String home = '/home';
  static const String homeScreen = '/homeScreen';
  static const String notificationsScreen = '/notificationsScreen';
  static const String allProductsScreen = '/allProductsScreen';
  static const String productDetailsScreen = '/productDetailsScreen';
  static const String favouriteScreen = '/favouriteScreen';
  static const String cartScreen = '/cartScreen';
  static const String moreScreen = '/moreScreen';
  static const String profileDetailsScreen = '/profileDetailsScreen';
  static const String changeLanguageScreen = '/changeLanguageScreen';
  static const String termsAndConditionsScreen = '/termsAndConditionsScreen';
  static const String aboutAppScreen = '/aboutAppScreen';
  static const String privacyPolicyscreen = '/privacyPolicyscreen';
  static const String addReviewscreen = '/addReviewscreen';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final Widget child;
    switch (settings.name) {
      case appStart:
        child = const AppStart();

      case onBoardingScreen:
        child = const OnBoardingScreen();

      case loginScreen:
        child = const LoginScreen();

      case signupScreen:
        child = const SignupScreen();

      case otpScreen:
        child = const OtpScreen();

      case resetPasswordScreen:
        child = const ResetPaswordScreen();

      case updateEmailScreen:
        child = const UpdateEmailScreen();

      case home:
        child = const Home();

      case homeScreen:
        child = HomeScreen();

      case notificationsScreen:
        child = const NotificationsScreen();

      case allProductsScreen:
        child = AllProductsScreen();

      case productDetailsScreen:
        final productId = settings.arguments as String;
        child = ProductDetailsScreen(productId: productId);

      case favouriteScreen:
        child = const FavouriteScreen();

      case cartScreen:
        child = const CartScreen();

      case moreScreen:
        child = const MoreScreen();

      case profileDetailsScreen:
        child = ProfileDetailsScreen();

      case changeLanguageScreen:
        child = const ChangeLanguageScreen();

      case termsAndConditionsScreen:
        child = const TermsAndConditionsScreen();

      case aboutAppScreen:
        child = const AboutAppScreen();

      case privacyPolicyscreen:
        child = const PrivacyPolicyScreen();

      case addReviewscreen:
      final productId = settings.arguments as String;
        child =  AddReviewScreen(productId: productId,);

      default:
        child = const OnBoardingScreen();
    }

    return MaterialPageRoute(builder: (context) => AppScaledBox(child: child));
  }
}

class AppScaledBox extends StatelessWidget {
  final Widget child;
  const AppScaledBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaledBox(
      width:
          ResponsiveValue<double>(
            context,
            defaultValue: 450,
            conditionalValues: const [
              Condition.between(
                start: 0,
                end: 370,
                value: 355,
                landscapeValue: 500,
              ),
              Condition.between(
                start: 370,
                end: 450,
                value: 370,
                landscapeValue: 520,
              ),
              Condition.between(
                start: 450,
                end: 800,
                value: 440,
                landscapeValue: 780,
              ),
              Condition.between(
                start: 800,
                end: 1400,
                value: 540,
                landscapeValue: 820,
              ),
              Condition.between(
                start: 1400,
                end: 9999,
                value: 640,
                landscapeValue: 900,
              ),
            ],
          ).value,
      child: BouncingScrollWrapper.builder(context, child, dragWithMouse: true),
    );
  }
}
