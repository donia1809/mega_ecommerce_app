import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ConfirmPasswordTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? oldPasswordController;

  const ConfirmPasswordTextFormField({
    super.key,
    this.controller,
    this.oldPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: AppLocalizations.of(context)!.enterConfirmationPassword,
      lable: AppLocalizations.of(context)!.confirmPassword,
      securedPassword: true,
      controller: controller,
      validator: (text) {
        if (text == null || text.trim().isEmpty == true) {
          return AppLocalizations.of(context)!.pleaseEnterConfirmationPassword;
        } else if ( oldPasswordController?.text != text) {
          return AppLocalizations.of(context)!.passwordDoesNotMatch;
        }
        return null;
      },
    );
  }
}
