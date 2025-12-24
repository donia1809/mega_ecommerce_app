import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/email_text_form_field.dart';
import 'package:mega_ecommerce_app/common_widget/password_text_form_field.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/signup/widget/confirm_password_text_field.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/signup/widget/name_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                  child: Text(
                     AppLocalizations.of(context)!.signUp, 
                     style: AppTextStyles.bold24)),

                SizedBox(height: context.screenHeight * 0.04),
                NameTextFormField(controller: nameController),
                SizedBox(height: context.screenHeight * 0.03),
                ////////////////////////////////////////////////////////////////////////////////
                EmailTextFormField(controller: emailController),
                SizedBox(height: context.screenHeight * 0.03),

                ////////////////////////////////////////////////////////////////////////////////
                PasswordTextFormField(),
                SizedBox(height: context.screenHeight * 0.03),

                ConfirmPasswordTextFormField(
                  controller: confirmPasswordController,
                ),

                ////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: context.screenHeight * 0.25),

                CommonElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.navigateTo('/home');
                    }
                  },
                  text:  AppLocalizations.of(context)!.signUp,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
