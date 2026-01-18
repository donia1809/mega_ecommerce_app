import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';

class AppFailureWidget extends StatelessWidget {
  final String? message;
  final VoidCallback onPressed;
  const AppFailureWidget({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message ?? 'Failed to load , check your internet connection',style: AppTextStyles.bold15.copyWith(color: AppColors.red),),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: onPressed, child: Text('Retry')),
          ],
        ),
      ),
    );
  }
}

