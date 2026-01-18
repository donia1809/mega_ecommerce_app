import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';

class CommonContainerWidget extends StatelessWidget {
  final Widget child;
  const CommonContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.containerBackground, width: 0.5),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0.5,
            color: AppColors.containerBackground,
            offset: Offset(0, 0.5),
          ),
        ],
        color: AppColors.white,
      ),
      padding: EdgeInsets.all(8),
      child: child,
    );
  }
}
