import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/email_text_form_field.dart';
import 'package:mega_ecommerce_app/common_widget/password_text_form_field.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/signup_use_cases.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/signup/signup_cubit.dart';
import 'package:mega_ecommerce_app/common_widget/confirm_password_text_field.dart';
import 'package:mega_ecommerce_app/common_widget/name_text_form_field.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: _SignupBody(),
    );
  }
}

class _SignupBody extends StatefulWidget {
  const _SignupBody();

  @override
  State<_SignupBody> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<_SignupBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _signUp() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      final params = SignupParams(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
      );
      context.read<SignupCubit>().signup(params);
    }

    // context.navigateTo('/otpScreen');
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
      body: BlocListener<SignupCubit, ISignupState>(
        listener: (context, state) {
          switch (state) {
            case SignupFailureState():
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            case SignupSuccessState():
              context.navigateTo(AppRoutes.otpScreen);
              break;
            default:
              break;
          }
        },
        child: BlocBuilder<SignupCubit, ISignupState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.signUp,
                          style: AppTextStyles.bold24,
                        ),
                      ),

                      SizedBox(height: context.screenHeight * 0.04),
                      NameTextFormField(controller: nameController),
                      SizedBox(height: context.screenHeight * 0.03),
                      ////////////////////////////////////////////////////////////////////////////////
                      EmailTextFormField(controller: emailController),
                      SizedBox(height: context.screenHeight * 0.03),

                      ////////////////////////////////////////////////////////////////////////////////
                      PasswordTextFormField(password: passwordController),
                      SizedBox(height: context.screenHeight * 0.03),

                      ConfirmPasswordTextFormField(
                        controller: confirmPasswordController,
                        oldPasswordController: passwordController,
                      ),

                      ////////////////////////////////////////////////////////////////////////////////
                      SizedBox(height: context.screenHeight * 0.25),

                      CommonElevatedButton(
                        isLoading: state is SignupLoadingState,
                        onPressed: () {
                          _signUp();
                        },
                        child: Text(AppLocalizations.of(context)!.signUp),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
