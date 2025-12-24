import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_ecommerce_app/common_widget/cart_details.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ListTile(
                trailing: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.containerBackground,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.none,
                  ),
                ),
                title: Text(
                  AppLocalizations.of(context)!.helloUser('Donia'),
                  style: AppTextStyles.bold28,
                ),
                subtitle: Text(AppLocalizations.of(context)!.welcomeToMega),
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/app_icon.png'),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.newArraivalProducts,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.bold15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.viewAll,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.regular13,
                  ),
                ],
              ),
              CartDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
