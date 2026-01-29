import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/otp/widget/pin_code_text_field_widget.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/verify_email_update_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/verify_email_update/verify_email_update_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerifyEmailUpdateCubit>(),
      child: const _VerifyEmailBody(),
    );
  }
}

class _VerifyEmailBody extends StatefulWidget {
  const _VerifyEmailBody();
  @override
  State<_VerifyEmailBody> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<_VerifyEmailBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  void _verifyAccount() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      final params = VerifyEmailUpdateParams(code: otpController.text);
      context.read<VerifyEmailUpdateCubit>().verifyEmailUpdate(params);
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
      body: BlocConsumer<VerifyEmailUpdateCubit, IVerifyEmailUpdateState>(
        listener: (context, state) {
          switch (state) {
            case VerifyEmailUpdateFailureState():
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            case VerifyEmailUpdateSuccessState():
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
                      isLoading: state is VerifyEmailUpdateLoadingState,
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
