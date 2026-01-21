import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/app_assets.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(AppImages.confirmationBg, fit: BoxFit.contain),
                      Image.asset(AppImages.confirmation, fit: BoxFit.contain),
                    ],
                  ),
                ),
                Text('Order Confirmed', style: AppTextStyles.bold28),
                Text(
                  textAlign: TextAlign.center,
                  'Your order has been confirmed, we will send you confirmation email shortly.',
                  style: AppTextStyles.regular15,
                ),
        
                SizedBox(height: 40,),
                CommonElevatedButton(
                  onPressed: () {
                    context.navigateTo(AppRoutes.myOrdersScreen);
                  },
                  text: AppLocalizations.of(context)!.goToOrders,
                ),
        
                SizedBox(height: 16,),
        
                CommonElevatedButton(
                  onPressed: () {
                    context.navigateTo(AppRoutes.home);
                  },
                  text: AppLocalizations.of(context)!.continueShopping,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
