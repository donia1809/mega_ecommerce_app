import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/new_password_text_field.dart';
import 'package:mega_ecommerce_app/common_widget/password_text_form_field.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/common_widget/confirm_password_text_field.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_password_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/update_password/update_password_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ResetPaswordScreen extends StatefulWidget {
  const ResetPaswordScreen({super.key});

  @override
  State<ResetPaswordScreen> createState() => _ResetPaswordScreenState();
}

class _ResetPaswordScreenState extends State<ResetPaswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdatePasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.navigateBack();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: _ResetPasswordScreenBody(),
      ),
    );
  }
}

class _ResetPasswordScreenBody extends StatefulWidget {
  const _ResetPasswordScreenBody();

  @override
  State<_ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<_ResetPasswordScreenBody> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<UpdatePasswordCubit>().updatePassword(
        UpdatePasswordParams(
          oldPassword: _oldPasswordController.text,
          newPassword: _newPasswordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePasswordCubit, IUpdatePasswordState>(
      listener: (context, state) {
        if (state is UpdatePasswordSuccessState) {
          context.navigateBack();
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              Text(
                AppLocalizations.of(context)!.newPassword,
                style: AppTextStyles.bold28,
              ),

              const SizedBox(height: 8),

              Text(
                AppLocalizations.of(context)!.pleaseEnterYourNewPassword,
                style: AppTextStyles.regular13,
              ),

              const SizedBox(height: 32),

              PasswordTextFormField(password: _oldPasswordController),

              const SizedBox(height: 16),

              NewPasswordTextFormField(password: _newPasswordController),

              const SizedBox(height: 16),

              ConfirmPasswordTextFormField(
                controller: _confirmPasswordController,
                oldPasswordController: _newPasswordController,
              ),

              const SizedBox(height: 300),

              BlocBuilder<UpdatePasswordCubit, IUpdatePasswordState>(
                builder: (context, state) {
                  if (state is UpdatePasswordFailureState) {
                    return AppFailureWidget(
                      message: state.failure.message,
                      onPressed: () => _submit(context),
                    );
                  }

                  return CommonElevatedButton(
                    isLoading: state is UpdatePasswordLoadingState,
                    onPressed: () => _submit(context),
                    child: Text(AppLocalizations.of(context)!.resetPassword),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
