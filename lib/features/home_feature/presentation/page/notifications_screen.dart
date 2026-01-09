import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.notification)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.containerBackground,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    color: AppColors.containerBackground,
                    offset: Offset(0, 0.5),
                  ),
                ],
                color: AppColors.white,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning! Get 20% Voucher',
                    style: AppTextStyles.bold15,
                  ),
                  Text(
                    "'Summer sale up to 20% off. Limited voucher. Get now!! 😜'",
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.016),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.containerBackground,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    color: AppColors.containerBackground,
                    offset: Offset(0, 0.5),
                  ),
                ],
                color: AppColors.white,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special offer just for you',
                    style: AppTextStyles.bold15,
                  ),
                  Text(
                    "New Autumn Collection 30% off",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
