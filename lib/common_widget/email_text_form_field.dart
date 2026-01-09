import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: AppLocalizations.of(context)!.enterYourEmailAddress,
      lable: AppLocalizations.of(context)!.emailAddress,
      controller: controller,
      validator: (text) {
        if (text == null || text.trim().isEmpty == true) {
          return AppLocalizations.of(context)!.pleaseEnterEmailAddress;
        }
        if (!text.contains('@')) {
          return AppLocalizations.of(context)!.pleaseEnterValidEmail;
        }
        return null;
      },
    );
  }
}
