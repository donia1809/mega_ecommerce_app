import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/signup/widget/name_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final String fullName;
  final String imagePath;

  ProfileDetailsScreen({
    super.key,
    required this.fullName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.profile)),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(imagePath)),
            SizedBox(height:context.screenHeight*0.015),
            NameTextFormField(controller: nameController),
            SizedBox(height:context.screenHeight*0.5),
            CommonElevatedButton(onPressed: (){}, text: AppLocalizations.of(context)!.save)
          ],
        ),
      ),
    );
  }
}
