import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppLocalizations.of(context)!.menu,
                  style: AppTextStyles.bold15,
                ),
              ),
              SizedBox(height: context.screenHeight * 0.02),
              ListTile(
                onTap: () {
                  context.navigateTo(
                    '/profileDetailsScreen',
                    arguments: {
                      'fullName': 'Full Name',
                      'imagePath': 'assets/images/app_icon.png',
                    },
                  );
                },
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/app_icon.png'),
                ),
                title: Text(AppLocalizations.of(context)!.fullName),
              ),
              SizedBox(height: context.screenHeight * 0.02),

              ListTile(
                onTap: () {
                  context.navigateTo('/profileDetailsScreen');
                },
                leading: SvgPicture.asset('assets/icons/info_circle.svg'),
                title: Text(AppLocalizations.of(context)!.accountInformation),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/resetPasswordScreen');
                },
                leading: SvgPicture.asset('assets/icons/lock.svg'),
                title: Text(AppLocalizations.of(context)!.updatePassword),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/updateEmailScreen');
                },
                leading: SvgPicture.asset('assets/icons/sms.svg'),
                title: Text(AppLocalizations.of(context)!.updateEmail),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/changeLanguageScreen');
                },
                leading: SvgPicture.asset('assets/icons/translate.svg'),
                title: Text(AppLocalizations.of(context)!.changeLanguage),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/termsAndConditionsScreen');
                },
                leading: SvgPicture.asset('assets/icons/forbidden.svg'),
                title: Text(AppLocalizations.of(context)!.termsAndConditions),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/privacyPolicyscreen');
                },
                leading: SvgPicture.asset('assets/icons/shield_tick.svg'),
                title: Text(AppLocalizations.of(context)!.privacyPolicy),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/aboutAppScreen');
                },
                leading: SvgPicture.asset('assets/icons/information.svg'),
                title: Text(AppLocalizations.of(context)!.aboutApp),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/profileDetailsScreen');
                },
                leading: SvgPicture.asset('assets/icons/message_question.svg'),
                title: Text(AppLocalizations.of(context)!.support),
              ),

              ListTile(
                onTap: () {
                  context.navigateTo('/profileDetailsScreen');
                },
                leading: SvgPicture.asset('assets/icons/star.svg'),
                title: Text(AppLocalizations.of(context)!.rateTheApp),
              ),

              ListTile(
                onTap: () {
                  context.navigateBack();
                },
                leading: SvgPicture.asset('assets/icons/logout.svg'),
                title: Text(
                  AppLocalizations.of(context)!.logout,
                  style: AppTextStyles.medium15.copyWith(color: AppColors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
