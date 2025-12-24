import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 300,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.red,
      ),
      child: Column(
        children: [
          Container(
            width: 160,
            height: 200,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.containerBackground,
            ),
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
