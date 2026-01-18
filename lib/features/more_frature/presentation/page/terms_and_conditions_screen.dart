import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/cubits/terms_and_conditions/terms_and_conditions_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => sl<TermsAndConditionsCubit>()..getTermsAndConditions(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.termsAndConditions),
        ),
        body: BlocBuilder<TermsAndConditionsCubit, ITermsAndConditionsState>(
          builder: (context, state) {
            if (state is TermsAndConditionsFailureState) {
              return Center(
                child: AppFailureWidget(
                  message: state.failure.message,
                  onPressed:
                      context
                          .read<TermsAndConditionsCubit>()
                          .getTermsAndConditions,
                ),
              );
            }
            if (state is TermsAndConditionsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is TermsAndConditionsSuccessState) {
              return Center(
                child: Text(
                  state.terms.content,
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
