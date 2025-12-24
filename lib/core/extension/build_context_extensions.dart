import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;
}     


extension NavigatorHelper on BuildContext {
  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void navigateBack() {
    Navigator.pop(this);
  }
}