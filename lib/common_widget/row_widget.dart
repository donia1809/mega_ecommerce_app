import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';

class RowWigdet extends StatelessWidget {
  final String text;
  final String clicableText;
  final VoidCallback onPress;
  const RowWigdet({
    super.key,
    required this.text,
    required this.clicableText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, textAlign: TextAlign.start, style: AppTextStyles.bold15),
        TextButton(
          onPressed: onPress,
          child: Text(
            clicableText,
            textAlign: TextAlign.start,
            style: AppTextStyles.regular13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}