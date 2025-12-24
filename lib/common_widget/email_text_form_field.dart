import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      hintText: 'Enter email address',
      lable: 'Email Address',
      controller: controller,
      validator: (text) {
        if (text == null || text.trim().isEmpty == true) {
          return 'please enter email address';
        }
        if (!text.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
