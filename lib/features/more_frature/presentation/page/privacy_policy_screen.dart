import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';

import 'package:mega_ecommerce_app/features/more_frature/presentation/cubits/privacy_policy/privacy_policy_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PrivacyPolicyCubit>()..gerPrivacyPolicy(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.privacyPolicy),
        ),
        body: BlocBuilder<PrivacyPolicyCubit, IPrivacyPolicyState>(
          builder: (context, state) {
            if (state is PrivacyPolicyFailureState) {
              return Center(
                child: AppFailureWidget(
                  message: state.failure.message,
                  onPressed: context.read<PrivacyPolicyCubit>().gerPrivacyPolicy,
                ),
              );
            }
            if (state is PrivacyPolicyLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is PrivacyPolicySuccessState) {
              return Center(
                child: Text(
                  state.policy.content,
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
