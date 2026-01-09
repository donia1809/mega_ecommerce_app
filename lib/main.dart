import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart' as di;
import 'package:mega_ecommerce_app/mega_ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  await di.init();
  runApp(const MegaEcommerceApp());
}
