import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class NewEmailTextFormField extends StatelessWidget {
  final TextEditingController newEmailController;

  const NewEmailTextFormField({
    super.key,
    required this.newEmailController,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: AppLocalizations.of(context)!.pleaseEnterYourNewEmail,
      lable: AppLocalizations.of(context)!.emailAddress,
      controller: newEmailController,
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
