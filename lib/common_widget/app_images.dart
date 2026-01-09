import 'dart:io';

import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider;
    if (path.startsWith('https')) {
      imageProvider = NetworkImage(path);
    } else if (path.startsWith('assets')) {
      imageProvider = AssetImage(path);
    } else {
      imageProvider = FileImage(File(path));
    }

    return Image(
      image: imageProvider,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => const Icon(Icons.error),
    );
  }
}
