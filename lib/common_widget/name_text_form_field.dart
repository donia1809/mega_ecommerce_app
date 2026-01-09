import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class NameTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: AppLocalizations.of(context)!.enterYourName,
      lable: AppLocalizations.of(context)!.fullName,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return AppLocalizations.of(context)!.pleaseEnterValidName;
        }
        return null;
      },
    );
  }
}
