import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/cubits/about_app/about_app_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AboutAppCubit>()..getAboutApp(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.aboutApp)),
        body: BlocBuilder<AboutAppCubit, IAboutAppState>(
          builder: (context, state) {
            if (state is AboutAppFailureState) {
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            }
            if (state is AboutAppLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is AboutAppSuccessState) {
              return Center(
                child: Text(
                  state.about.content,
                  style: TextStyle(fontSize: 16),
                  softWrap: true,
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
