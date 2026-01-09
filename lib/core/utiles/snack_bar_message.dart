import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(color: AppColors.white)),
      backgroundColor: color,
    ),
  );
}
