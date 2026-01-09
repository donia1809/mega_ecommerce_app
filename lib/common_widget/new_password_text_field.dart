import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class NewPasswordTextFormField extends StatelessWidget {
  final TextEditingController? password;

  const NewPasswordTextFormField({super.key,  this.password});

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: AppLocalizations.of(context)!.pleaseEnterYourNewPassword,
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
