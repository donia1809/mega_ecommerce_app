import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.changeLanguage),
      ),
      body: Column(
        children: [
          ListTile(onTap: (){},
            title: Text(AppLocalizations.of(context)!.english),
          ),
          ListTile(onTap: (){},
            title: Text(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }
}
