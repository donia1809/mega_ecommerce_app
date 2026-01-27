import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/utiles/app_assets.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class EmptyNotificationScreenWidget extends StatelessWidget {
  const EmptyNotificationScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppImages.notification, fit: BoxFit.contain),

          Text(AppLocalizations.of(context)!.silenceIsGolden),
          Text(AppLocalizations.of(context)!.weWellLetYou),
          TextButton(
            onPressed: () {
              context.navigateTo(AppRoutes.allProductsScreen);
            },
            child: Text(AppLocalizations.of(context)!.exploreProducts),
          ),
        ],
      ),
    );
  }
}
