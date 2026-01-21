import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/app_icons.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/logout/logout_cubit.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/user_profile/user_profile_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserProfileCubit>()..getProfile()),
        BlocProvider(create: (context) => sl<LogoutCubit>()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.menu,
                      style: AppTextStyles.bold15,
                    ),
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<UserProfileCubit, IUserProfileState>(
                    builder: (context, state) {
                      if (state is UserProfileLoadingState) {
                        return AppLoadingWidget();
                      }
                      if (state is UserProfileSuccessState) {
                        return ListTile(
                          onTap: () {
                            context
                                .navigateTo(
                                  AppRoutes.profileDetailsScreen,
                                  arguments: state.profile,
                                )
                                .then((_) {
                                  if (context.mounted) {
                                    context
                                        .read<UserProfileCubit>()
                                        .getProfile();
                                  }
                                });
                          },
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                              'assets/images/app_icon.png',
                            ),
                          ),
                          title: Text(state.profile.name),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                  const SizedBox(height: 16),

                  Container(decoration: BoxDecoration(color: AppColors.containerBackground,borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      onTap: () {
                        context.navigateTo(AppRoutes.myOrdersScreen);
                      },
                      trailing: Icon(Icons.arrow_right_alt_sharp),
                      leading: SvgPicture.asset(AppIcons.shoppingBag),
                      title: Text(AppLocalizations.of(context)!.myOrders),
                    ),
                  ),

                 // const SizedBox(height: 16),

                  ListTile(
                    onTap: () {
                      context.navigateTo(
                        AppRoutes.profileDetailsScreen,
                        // arguments: state.profile,
                      );
                    },
                    leading: SvgPicture.asset('assets/icons/info_circle.svg'),
                    title: Text(
                      AppLocalizations.of(context)!.accountInformation,
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/resetPasswordScreen');
                    },
                    leading: SvgPicture.asset('assets/icons/lock.svg'),
                    title: Text(AppLocalizations.of(context)!.updatePassword),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/updateEmailScreen');
                    },
                    leading: SvgPicture.asset('assets/icons/sms.svg'),
                    title: Text(AppLocalizations.of(context)!.updateEmail),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/changeLanguageScreen');
                    },
                    leading: SvgPicture.asset('assets/icons/translate.svg'),
                    title: Text(AppLocalizations.of(context)!.changeLanguage),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/termsAndConditionsScreen');
                    },
                    leading: SvgPicture.asset('assets/icons/forbidden.svg'),
                    title: Text(
                      AppLocalizations.of(context)!.termsAndConditions,
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/privacyPolicyscreen');
                    },
                    leading: SvgPicture.asset('assets/icons/shield_tick.svg'),
                    title: Text(AppLocalizations.of(context)!.privacyPolicy),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/aboutAppScreen');
                    },
                    leading: SvgPicture.asset('assets/icons/information.svg'),
                    title: Text(AppLocalizations.of(context)!.aboutApp),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/profileDetailsScreen');
                    },
                    leading: SvgPicture.asset(
                      'assets/icons/message_question.svg',
                    ),
                    title: Text(AppLocalizations.of(context)!.support),
                  ),

                  ListTile(
                    onTap: () {
                      context.navigateTo('/profileDetailsScreen');
                    },
                    leading: SvgPicture.asset('assets/icons/star.svg'),
                    title: Text(AppLocalizations.of(context)!.rateTheApp),
                  ),

                  BlocConsumer<LogoutCubit, ILogoutState>(
                    listener: (context, state) {
                      if (state is LogoutSuccessState) {
                        context.navigateAndRemove(AppRoutes.loginScreen);
                      } else if (state is LogoutFailureState) {
                        showSnackBar(
                          context: context,
                          message: state.failure.message,
                          color: AppColors.red,
                        );
                      }
                    },
                    builder: (context, state) {
                      return ListTile(
                        onTap:
                            state is LogoutLoadingState
                                ? null
                                : () {
                                  context.read<LogoutCubit>().logout();
                                },
                        leading:
                            state is LogoutLoadingState
                                ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                                : SvgPicture.asset('assets/icons/logout.svg'),
                        title: Text(
                          AppLocalizations.of(context)!.logout,
                          style: AppTextStyles.medium15.copyWith(
                            color: AppColors.red,
                          ),
                        ),
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
