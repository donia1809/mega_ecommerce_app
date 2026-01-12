import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {
            context.navigateTo('/notificationsScreen');
          },
          child: SvgPicture.asset(
            'assets/icons/notification.svg',
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      title: Text(
        AppLocalizations.of(context)!.helloUser('donia'),
        style: AppTextStyles.bold28,
      ),
      subtitle: Text(AppLocalizations.of(context)!.welcomeToMega),
    );
  }
}
