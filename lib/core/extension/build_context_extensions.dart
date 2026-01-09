import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;
}

extension NavigatorHelper on BuildContext {
  Future<T?> navigateTo<T>(String routeName, {Object? arguments}) async {
    return await Navigator.pushNamed<T?>(this, routeName, arguments: arguments);
  }

  void  navigateBack<T>([T? result])  {
    return  Navigator.pop<T?>(this, result);
  }

  void remove() {
    Navigator.popUntil(this, (route) => route.isFirst);
  }

  void navigateAndRemove(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }
}
