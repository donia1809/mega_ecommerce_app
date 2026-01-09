import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/email_text_form_field.dart';
import 'package:mega_ecommerce_app/common_widget/new_email_text_field.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_email_ue_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/update_email/update_email_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _ResetPaswordScreenState();
}

class _ResetPaswordScreenState extends State<UpdateEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateEmailCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.navigateBack();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: _ResetEmailScreenBody(),
      ),
    );
  }
}

class _ResetEmailScreenBody extends StatefulWidget {
  @override
  State<_ResetEmailScreenBody> createState() => _ResetEmailScreenBodyState();
}

class _ResetEmailScreenBodyState extends State<_ResetEmailScreenBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _newEmailController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<UpdateEmailCubit>().updateEmail(
        UpdateEmailParams(newEmail: _newEmailController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateEmailCubit, IUpdateEmailState>(
      listener: (context, state) {
        if (state is UpdateEmailSuccessState) {
          context.navigateBack();
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.newEmail,
                    style: AppTextStyles.bold28,
                  ),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text(
                    AppLocalizations.of(context)!.pleaseEnterYourNewEmail,
                    style: AppTextStyles.regular13,
                  ),
                  SizedBox(height: context.screenHeight * 0.05),
                  EmailTextFormField(controller: _emailController),
                  SizedBox(height: 16),
                  NewEmailTextFormField(
                    newEmailController: _newEmailController,
                  ),
                  SizedBox(height: 390),
                  BlocBuilder<UpdateEmailCubit, IUpdateEmailState>(
                    builder: (context, state) {
                      if (state is UpdateEmailFailureState) {
                        return AppFailureWidget(
                          message: state.failure.message,
                          onPressed: () => _submit(context),
                        );
                      }
                      return CommonElevatedButton(
                    isLoading: state is UpdateEmailLoadingState,
                        onPressed: () => _submit(context),
                        text: AppLocalizations.of(context)!.next,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
