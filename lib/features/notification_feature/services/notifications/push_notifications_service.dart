import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/notifications/local_notification_service.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/firebase/firebase_options.dart';

class PushNotificationsService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    //FCM Token
    String? fcmToken = await messaging.getToken();
    log(fcmToken ?? 'null');

    //handle notification in backGround & killed (when app is closed)
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    handleForeGroundMessage();
  }

  //future void function => RemoteMessge (بيقدمه ال firebase)
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    //init firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log(message.notification?.title ?? '');
  }

  /*
  handle notification in foreGround
    stream (alot of notifications) of remote message بنقدر نعمل عليها listen
    لما يجي notification اقدر اعمل عليها action معين
    بستقبل ال notification دي عن طريق ال onMessage
    listen دي بمجرد ما يجي notification بعمل عليها action معين
    action=> اول ما تيجي النوتيفيكيشن هظهرها باستخدام ال local
 */
  static void handleForeGroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //show local notification
      LocalNotificationService.showBasicNotification(message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      // LocalNotificationService.streamController.add(value);
    });


  }
}
