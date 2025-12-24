import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/email_text_form_field.dart';
import 'package:mega_ecommerce_app/common_widget/password_text_form_field.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/login/widget/rich_text_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(child: Text( AppLocalizations.of(context)!.login, style: AppTextStyles.bold24)),

                SizedBox(height: context.screenHeight * 0.02),

                ////////////////////////////////////////////////////////////////////////////////
                EmailTextFormField(controller: emailController),
                SizedBox(height: context.screenHeight * 0.03),

                ////////////////////////////////////////////////////////////////////////////////
                PasswordTextFormField(),
                SizedBox(height: context.screenHeight * 0.03),

                ////////////////////////////////////////////////////////////////////////////////
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                     onPressed: () {
                      context.navigateTo('/otpScreen');
                    },
                    child: Text( 
                      AppLocalizations.of(context)!.forgetPassword,
                      style: AppTextStyles.button18.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.06),
                Divider(),
                SizedBox(height: context.screenHeight * 0.01),

                ////////////////////////////////////////////////////////////////////////////////
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      context.navigateTo('/signupScreen');
                    },
                    child: RichTextWidget(
                      text1:  AppLocalizations.of(context)!.alreadyHaveAccount,
                      clicableText:  AppLocalizations.of(context)!.signUp,
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.01),
                Divider(),
                SizedBox(height: context.screenHeight * 0.01),

                ////////////////////////////////////////////////////////////////////////////////
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichTextWidget(
                    text1: AppLocalizations.of(context)!.exploreAppToGetAlittleKnowAboutFeaturesWithOutCredationals,
                    clicableText:  AppLocalizations.of(context)!.continueAsGuest,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.25),

                ////////////////////////////////////////////////////////////////////////////////
                CommonElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.navigateTo('/home');
                    }
                  },
                  text:  AppLocalizations.of(context)!.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
