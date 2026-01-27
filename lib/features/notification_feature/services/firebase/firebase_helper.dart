import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/notifications/local_notification_service.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/notifications/push_notifications_service.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseHelper {
  static Future<void> init() async {
    await Firebase.initializeApp(
      name: 'Mega Intern App',
      options: DefaultFirebaseOptions.currentPlatform,
      //دي مش هحطهل في future.wait عشان النوتيفيكيشن معتمدة عليها
      // و شرطها ان الي جواها ميبقوش معتمدين علي بعض
    );

    await FirebaseMessaging.instance.requestPermission();
    
    //عملت دي عشان ال app, مياخدش وقت طويل علي ما يرن
    await Future.wait([
      LocalNotificationService.init(), //دي كانت بتتنفذ و استني تخلص عشان
      PushNotificationsService.init(), //دي تتنفذ و كدل باخد وقت طويل عشان كدا
    ]);

     // subscribe announcements topic
    await FirebaseMessaging.instance.subscribeToTopic('ANNOUNCEMENT');

  }
}
