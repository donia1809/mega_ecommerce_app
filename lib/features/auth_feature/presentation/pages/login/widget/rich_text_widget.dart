import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';

class RichTextWidget extends StatelessWidget {
  final String text1;
  final String clicableText;
 
  const RichTextWidget({
    super.key,
    required this.text1,
    required this.clicableText,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: AppTextStyles.regular15,
        children: <TextSpan>[
          TextSpan(
            text: clicableText,
            style: AppTextStyles.bold15,
          ),
        ],
      ),
    );
  }
}
