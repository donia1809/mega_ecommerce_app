import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  static TextEditingController password = TextEditingController();

  const PasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: 'Enter your password',
      lable: 'Password',
      securedPassword: true,
      controller: password,
      validator: (text) {
        if (text == null || text.trim().isEmpty == true) {
          return 'please enter Password';
        }
        if (text.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}
