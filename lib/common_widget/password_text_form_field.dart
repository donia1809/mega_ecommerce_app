import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController? password;

  const PasswordTextFormField({super.key,  this.password});

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: AppLocalizations.of(context)!.pleaseEnterPassword,
      lable: AppLocalizations.of(context)!.password,
      securedPassword: true,
      controller: password,
      validator: (text) {
        if (text == null || text.trim().isEmpty == true) {
          return AppLocalizations.of(context)!.pleaseEnterValidPassword;
        }
        if (text.length < 6) {
          return AppLocalizations.of(context)!.passwordMustBeAtLeast6Characters;
        }
        return null;
      },
    );
  }
}
