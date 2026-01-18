import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:isLoading?null: onPressed,
      child: Builder(
        builder: (context) {
          if (isLoading) {
            return SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(color: AppColors.white,),
            );
          }
          return Text(text);
        },
      ),
    );
  }
}
