import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isLoading;
  final double? width;
  final Color color;
  final Color textColor;

  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.width,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize:
            width == null ? Size(double.infinity, 56) : Size(width!, 56),
      ),
      onPressed: isLoading ? null : onPressed,
      child: Builder(
        builder: (context) {
          if (isLoading) {
            return SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(color: AppColors.white),
            );
          }
          return Center(child: child);
        },
      ),
    );
  }
}
