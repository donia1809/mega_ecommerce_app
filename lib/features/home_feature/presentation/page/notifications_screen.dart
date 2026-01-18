import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
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
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            CommonContainerWidget(
              
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
            CommonContainerWidget(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special offer just for you',
                    style: AppTextStyles.bold15,
                  ),
                  Text("New Autumn Collection 30% off"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
