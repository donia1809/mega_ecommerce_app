import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_enum.dart';

class NotificationRouter {
  static void handleFirebaseTap({
    required final Map<String, dynamic> data,
    required final BuildContext context,
  }) {
    final type = NotificationEnum.fromString(data['type'] ?? '');
    final String? notifiedId = data['orderId'] ?? data['productId'];
    handle(context: context, type: type, data: notifiedId);
  }

  static void handle({
    required NotificationEnum type,
    required String? data,
    required BuildContext context,
  }) {
    if (data == null) return;
    switch (type) {
      case NotificationEnum.order:
        context.navigateTo(AppRoutes.orderDetailsScreen, arguments: data);

        break;

      case NotificationEnum.product:
      case NotificationEnum.announcement:
        context.navigateTo(
          AppRoutes.productDetailsScreen,
          arguments: data,
        );

        break;

      case NotificationEnum.system:
      case NotificationEnum.reminder:
        // do nothing
        break;
    }
  }
}
