import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';

typedef Validator = String? Function(String? text);

class CommonTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final String lable;
  final TextEditingController? controller;
  final Validator validator;
  final bool securedPassword;

  const CommonTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.lable,
    required this.controller,
    required this.validator,
    this.securedPassword = false,
  });

  @override
  State<CommonTextFormFieldWidget> createState() =>
      _CommonTextFormFieldWidgetState();
}

class _CommonTextFormFieldWidgetState extends State<CommonTextFormFieldWidget> {
  bool isObscured = true;
  @override
  void initState() {
    super.initState();
    isObscured = widget.securedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObscured,
      keyboardType:
          widget.securedPassword
              ? TextInputType.visiblePassword
              : TextInputType.text,
      decoration: InputDecoration(
        label: Text(widget.lable),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTextStyles.regular13,
        hintText: widget.hintText,
        suffixIcon:
            widget.securedPassword
                ? InkWell(
                  onTap: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  child: Icon(
                    isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                  ),
                )
                : null,
      ),
    );
  }
}
