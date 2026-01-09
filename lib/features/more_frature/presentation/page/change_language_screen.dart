import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/cubit/language_cubit.dart';
import 'package:mega_ecommerce_app/core/domain/entity/language/app_language_enum.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.changeLanguage)),
      body: Column(
        children: [
          BlocBuilder<AppLanguageCubit, AppLanguageState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  context.read<AppLanguageCubit>().updateLanguage(
                    AppLanguageEnum.en,
                  );
                },
                title: Text(AppLocalizations.of(context)!.english),
              );
            },
          ),
          BlocBuilder<AppLanguageCubit, AppLanguageState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  context.read<AppLanguageCubit>().updateLanguage(
                    AppLanguageEnum.ar,
                  );
                },
                title: Text(AppLocalizations.of(context)!.arabic),
              );
            },
          ),
        ],
      ),
    );
  }
}
