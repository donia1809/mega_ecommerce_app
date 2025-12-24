import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/password_text_form_field.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/signup/widget/confirm_password_text_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ResetPaswordScreen extends StatefulWidget {

  const ResetPaswordScreen({super.key});

  @override
  State<ResetPaswordScreen> createState() => _ResetPaswordScreenState();
}

class _ResetPaswordScreenState extends State<ResetPaswordScreen> {
  final TextEditingController resetPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              Text( AppLocalizations.of(context)!.newPassword, style: AppTextStyles.bold28),
              SizedBox(height: context.screenHeight * 0.015),
              Text( AppLocalizations.of(context)!.pleaseEnterYourNewPassword,
                style: AppTextStyles.regular13,
              ),
              SizedBox(height: context.screenHeight * 0.05),
              PasswordTextFormField(),
              SizedBox(height: context.screenHeight * 0.05),
              ConfirmPasswordTextFormField(controller: resetPasswordController),
              SizedBox(height: context.screenHeight * 0.3),
              CommonElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                       context.navigateTo('/loginScreen');
                    }
              }, text: AppLocalizations.of(context)!.resetPassword),
            ],
          ),)
        ),
      ),
      )
    );
  }
}
