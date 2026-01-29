import 'dart:convert';
import 'package:mega_ecommerce_app/features/notification_feature/services/notification_router.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/notifications/local_notification_service.dart';
import 'package:flutter/material.dart';

class NotificationListenerWidget extends StatefulWidget {
  final Widget child;
  const NotificationListenerWidget({super.key, required this.child});

  @override
  State<NotificationListenerWidget> createState() =>
      _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState
    extends State<NotificationListenerWidget> {
  @override
  void initState() {
    super.initState();
    // Listen for foreground/background notification taps
    LocalNotificationService.streamController.stream.listen((response) {
      try {
        if (response.payload == null) return;

        final data = jsonDecode(response.payload!);
        if (mounted == false) return;
        NotificationRouter.handleFirebaseTap(context: context, data: data);
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
