import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/email_text_form_field.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/verification_code_enum.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/forget_password_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordCubit>(),
      child: const _ForgetPasswordbody(),
    );
  }
}

class _ForgetPasswordbody extends StatefulWidget {
  const _ForgetPasswordbody();
  @override
  State<_ForgetPasswordbody> createState() => __ForgetPasswordScreenState();
}

class __ForgetPasswordScreenState extends State<_ForgetPasswordbody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void _verifyAccount() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      final params = ForgetPasswordParams(email: emailController.text);
      context.read<ForgetPasswordCubit>().forgetPassword(params);
    }
  }

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
      body: BlocConsumer<ForgetPasswordCubit, IForgetPasswordState>(
        listener: (context, state) {
          switch (state) {
            case ForgetPasswordFailureState():
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            case ForgetPasswordSuccessState():
              context.navigateTo(
                AppRoutes.otpScreen,
                arguments: VerificationCodeEnum.forgetPassword,
              );
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.forgetPassword,
                      style: AppTextStyles.bold15,
                    ),
                    SizedBox(height: 8),

                    Text(
                      AppLocalizations.of(context)!.writeYourEmail,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regular13,
                    ),

                    SizedBox(height: 16),

                    ////////////////////////////////////////////////////////////////////////////////
                    Image.asset('assets/images/lock.png', fit: BoxFit.fitWidth),
                    SizedBox(height: 32),

                    EmailTextFormField(controller: emailController),
                    ////////////////////////////////////////////////////////////////////////////////
                    Spacer(),
                    CommonElevatedButton(
                      isLoading: state is ForgetPasswordLoadingState,
                      onPressed: () {
                        _verifyAccount();
                      },
                      child: Text(AppLocalizations.of(context)!.next),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
