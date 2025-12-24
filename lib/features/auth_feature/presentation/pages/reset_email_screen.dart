import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/email_text_form_field.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class UpdateEmailScreen extends StatefulWidget {

  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _ResetPaswordScreenState();
}

class _ResetPaswordScreenState extends State<UpdateEmailScreen> {
  final TextEditingController newEmailController = TextEditingController();
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
              Text( AppLocalizations.of(context)!.newEmail, style: AppTextStyles.bold28),
              SizedBox(height: context.screenHeight * 0.015),
              Text( AppLocalizations.of(context)!.pleaseEnterYourNewEmail,
                style: AppTextStyles.regular13,
              ),
              SizedBox(height: context.screenHeight * 0.05),
              EmailTextFormField(controller: newEmailController,),
              SizedBox(height: context.screenHeight * 0.05),
              CommonElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                       context.navigateTo('/otpScreen');
                    }
              }, text: AppLocalizations.of(context)!.next),
            ],
          ),)
        ),
      ),
      )
    );
  }
}
