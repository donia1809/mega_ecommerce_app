import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static StreamController<NotificationResponse> streamController =
      StreamController.broadcast();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  //////////////// basic notification ////////////////
  static Future<void> showBasicNotification(RemoteMessage message) async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      //لحد هنا ال notification بتظهر برضو في ال background بس
      'basic_channel', //channelId
      'basic notifications', //channelName
      // السطرين دول بيخلوا ال notification تظهر في ال foreground
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails details = NotificationDetails(
      android: android,
    );
    
    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/1000,
      message.notification?.title,
      message.notification?.body,
      details,
      payload: jsonEncode(message.data), // لما اضغط علي ال notification , ال app يفتح
    );
  }

  /*
  //////////////// repeated notification ////////////////
  static void showRepeatedNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'id 2',
      'repeated notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Reapated Notification',
      'body',
      RepeatInterval.daily,
      details,
      payload: "Payload Data",
    );
  }
  */
}

//call these functions => LocalNotificationService.FuncName();
