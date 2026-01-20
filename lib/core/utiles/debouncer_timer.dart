import 'dart:async';

import 'package:flutter/material.dart';

class DebouncerTimer {
  final int milliseconds;
  Timer? _timer;

  DebouncerTimer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancle()
  {
    _timer?.cancel();
  }
}
