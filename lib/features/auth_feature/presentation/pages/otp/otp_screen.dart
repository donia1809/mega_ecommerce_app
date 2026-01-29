import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/verify_account_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/verify_account/verify_account_cubit.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/otp/widget/pin_code_text_field_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerifyAccountCubit>(),
      child: const _Otpbody(),
    );
  }
}

class _Otpbody extends StatefulWidget {
  const _Otpbody();
  @override
  State<_Otpbody> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<_Otpbody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _verifyAccount() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      final params = VerifyAccountParams(otp: otpController.text);
      context.read<VerifyAccountCubit>().verifyAccount(params);
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
      body: BlocConsumer<VerifyAccountCubit, IVerifyAccountState>(
        listener: (context, state) {
          switch (state) {
            case VerifyAccountFailureState():
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            case VerifyAccountSuccessState():
              context.navigateTo(AppRoutes.loginScreen);
              break;
            default:
              break;
          }
        },
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
                        AppLocalizations.of(context)!.verificationCode,
                        style: AppTextStyles.bold28,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),

                    ////////////////////////////////////////////////////////////////////////////////
                    Image.asset('assets/images/lock.png', fit: BoxFit.fitWidth),
                    SizedBox(height: context.screenHeight * 0.1),

                    PinCodeTextFieldWidget(controller: otpController),

                    ////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: context.screenHeight * 0.3),
                    CommonElevatedButton(
                      isLoading: state is VerifyAccountLoadingState,
                      onPressed: () {
                        _verifyAccount();
                      },
                      child: Text(AppLocalizations.of(context)!.verify),
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
