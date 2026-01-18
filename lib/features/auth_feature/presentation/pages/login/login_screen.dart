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
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/login_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/login/login_cubit.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/login/widget/rich_text_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      final params = LoginParams(
        email: emailController.text,
        password: passwordController.text,
      );
      context.read<LoginCubit>().login(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, ILoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginFailureState():
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            case LoginSuccessState():
              final user = state.data;
              context.navigateTo(AppRoutes.home, arguments: user);
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: AppTextStyles.bold24,
                      ),
                    ),

                    SizedBox(height: context.screenHeight * 0.02),

                    ////////////////////////////////////////////////////////////////////////////////
                    EmailTextFormField(controller: emailController),
                    SizedBox(height: context.screenHeight * 0.03),

                    ////////////////////////////////////////////////////////////////////////////////
                    PasswordTextFormField(password: passwordController),
                    SizedBox(height: context.screenHeight * 0.03),

                    ////////////////////////////////////////////////////////////////////////////////
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.navigateTo(AppRoutes.resetPasswordScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          style: AppTextStyles.button18.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.06),
                    Divider(),
                    SizedBox(height: context.screenHeight * 0.01),

                    ////////////////////////////////////////////////////////////////////////////////
                    Align(
                      alignment:
                          Directionality.of(context) == TextDirection.rtl
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          context.navigateTo('/signupScreen');
                        },
                        child: RichTextWidget(
                          text1:
                              AppLocalizations.of(context)!.alreadyHaveAccount,
                          clicableText: AppLocalizations.of(context)!.signUp,
                        ),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    Divider(),
                    SizedBox(height: context.screenHeight * 0.01),

                    ////////////////////////////////////////////////////////////////////////////////
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichTextWidget(
                        text1:
                            AppLocalizations.of(
                              context,
                            )!.exploreAppToGetAlittleKnowAboutFeaturesWithOutCredationals,
                        clicableText:
                            AppLocalizations.of(context)!.continueAsGuest,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.25),

                    ////////////////////////////////////////////////////////////////////////////////
                    CommonElevatedButton(
                      isLoading: state is LoginLoadingState,
                      onPressed: () {
                        _login();
                      },
                      text: AppLocalizations.of(context)!.login,
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
