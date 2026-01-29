import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart' as di;
import 'package:mega_ecommerce_app/features/chat_feature/services/pusher_service.dart';
import 'package:mega_ecommerce_app/features/notification_feature/services/firebase/firebase_helper.dart';

import 'package:mega_ecommerce_app/mega_ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseHelper.init();
  await PusherService.init();
  await di.init();
  FlutterNativeSplash.remove();
  runApp(const MegaEcommerceApp());
}
