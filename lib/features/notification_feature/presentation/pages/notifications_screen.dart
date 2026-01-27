import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/notification_feature/presentation/cubits/notification/notification_cubit.dart';
import 'package:mega_ecommerce_app/features/notification_feature/presentation/widget/empty_notification_screen_widget.dart';
import 'package:mega_ecommerce_app/features/notification_feature/presentation/widget/notification_list_view_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.notification)),
      body: BlocProvider(
        create: (context) => sl<NotificationCubit>()..getNotification(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<NotificationCubit, INotificationState>(
            builder: (context, state) {
              if (state is NotificationLoadingState) {
                return AppLoadingWidget();
              } else if (state is NotificationFailureState) {
                return AppFailureWidget(
                  message: state.failure.message,
                  onPressed: () {
                    context.read<NotificationCubit>().getNotification();
                  },
                );
              } else if (state is NotificationSuccessState) {
                if (state.notification.isEmpty) {
                  return EmptyNotificationScreenWidget();
                }
                return NotificationListViewWidget(notifications: state.notification);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
