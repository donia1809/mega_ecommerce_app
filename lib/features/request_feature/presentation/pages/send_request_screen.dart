import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/use_cases/send_request_use_case.dart';
import 'package:mega_ecommerce_app/features/request_feature/presentation/cubits/send_request/send_request_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class SendRequestScreen extends StatefulWidget {
  const SendRequestScreen({super.key});

  @override
  State<SendRequestScreen> createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => sl<SendRequestCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.requestBeStoreOwner,
                  style: AppTextStyles.bold15,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.welcomeRequestMessage,
                  style: AppTextStyles.medium15.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: 16),
                CommonTextFormFieldWidget(
                  hintText: AppLocalizations.of(context)!.describeYourBusiness,
                  lable: AppLocalizations.of(context)!.business,
                  controller: _controller,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty == true) {
                      return AppLocalizations.of(
                        context,
                      )!.pleaseEnterYourBusinessDescribtion;
                    }

                    return null;
                  },
                ),

                Spacer(),
                BlocConsumer<SendRequestCubit, ISendRequestState>(
                  listener: (context, state) {
                    if (state is SendRequestSuccessState) {
                      showSnackBar(
                        context: context,
                        message: 'sent Request Successfilly',
                        color: AppColors.green,
                      );
                    }
                  },

                  builder: (context, state) {
                    if (state is SendRequestFailureState) {
                      return AppFailureWidget(
                        message: state.failure.message,
                        onPressed: () {
                          context.read<SendRequestCubit>().sendRequest(
                            RequestParams(message: _controller.text),
                          );
                        },
                      );
                    }
                    return CommonElevatedButton(
                      isLoading: state is SendRequestLoadingState,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SendRequestCubit>().sendRequest(
                            RequestParams(message: _controller.text),
                          );
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.sendRequest),
                    );
                  },
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
