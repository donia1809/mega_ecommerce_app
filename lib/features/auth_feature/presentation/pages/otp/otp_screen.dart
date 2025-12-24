import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/otp/widget/pin_code_text_field_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.navigateBack();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text( AppLocalizations.of(context)!.verificationCode, style: AppTextStyles.bold28),
                ),
                SizedBox(height: context.screenHeight * 0.03),

                ////////////////////////////////////////////////////////////////////////////////
                Image.asset('assets/images/lock.png', fit: BoxFit.fitWidth),
                SizedBox(height: context.screenHeight * 0.1),

                PinCodeTextFieldWidget(controller: otpController),

                ////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: context.screenHeight * 0.3),
                CommonElevatedButton(
                  onPressed: () {
                   if (_formKey.currentState!.validate()) {
                       context.navigateTo('/resetPasswordScreen');
                    }
                  },
                  text: AppLocalizations.of(context)!.verify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
