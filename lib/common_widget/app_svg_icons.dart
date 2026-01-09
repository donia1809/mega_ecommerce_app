import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImages({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('https')) {
      return SvgPicture.network(
        path,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (_) => const CircularProgressIndicator(),
      );
    } else if (path.startsWith('assets')) {
      return SvgPicture.asset(path, width: width, height: height, fit: fit);
    }
    else {
       SvgPicture.file(
        File(path),
        width: width,
        height: height,
        fit: fit,
      );
    }
    return SizedBox();
  }
}
