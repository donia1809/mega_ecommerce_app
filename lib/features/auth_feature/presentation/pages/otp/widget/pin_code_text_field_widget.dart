import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const PinCodeTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: controller,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.oTPIsRequired;
        }
        if (value.length < 4) {
          return AppLocalizations.of(context)!.enterCompleteOTP;
        }
        return null;
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 65,
        fieldWidth: 65,
        activeColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        inactiveColor: Colors.grey,
      ),
      onChanged: (value) {},
    );
  }
}
