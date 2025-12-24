import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/login/login_screen.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/otp/otp_screen.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/reset_Pasword_screen.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/reset_email_screen.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/signup/signup_screen.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/page/cart_screen.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/page/favourite_screen.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/page/home-screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/about_app_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/change_language_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/more_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/privacy_policy_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/profile_details_screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/terms_and_conditions_screen.dart';
import 'package:mega_ecommerce_app/home.dart';
import 'package:mega_ecommerce_app/features/on_boarding_screen.dart';

class AppRoutes {
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String otpScreen = '/otpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String updateEmailScreen = '/updateEmailScreen';
  static const String home = '/home';
  static const String homeScreen = '/homeScreen';
  static const String favouriteScreen = '/favouriteScreen';
  static const String cartScreen = '/cartScreen';
  static const String moreScreen = '/moreScreen';
  static const String profileDetailsScreen = '/profileDetailsScreen';
  static const String changeLanguageScreen = '/changeLanguageScreen';
  static const String termsAndConditionsScreen = '/termsAndConditionsScreen';
  static const String aboutAppScreen = '/aboutAppScreen';
  static const String privacyPolicyscreen = '/privacyPolicyscreen';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      case otpScreen:
        return MaterialPageRoute(builder: (_) => OtpScreen());

      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPaswordScreen());

      case updateEmailScreen:
        return MaterialPageRoute(builder: (_) => UpdateEmailScreen());

      case home:
        return MaterialPageRoute(builder: (_) => Home());

      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case favouriteScreen:
        return MaterialPageRoute(builder: (_) => FavouriteScreen());

      case cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());

      case moreScreen:
        return MaterialPageRoute(builder: (_) => MoreScreen());

      case profileDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => ProfileDetailsScreen(
                fullName: args?['fullName'] ?? '',
                imagePath: args?['imagePath'] ?? 'assets/images/app_icon.png',
              ),
        );

      case changeLanguageScreen:
        return MaterialPageRoute(builder: (_) => ChangeLanguageScreen());

      case termsAndConditionsScreen:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsScreen());

      case aboutAppScreen:
        return MaterialPageRoute(builder: (_) => AboutAppScreen());

      case privacyPolicyscreen:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());

      default:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
    }
  }
}
