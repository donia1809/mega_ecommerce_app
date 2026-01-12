import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductsEntity product;

  const ProductDetailsWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(product.name, style: AppTextStyles.bold15),
        Column(
          children: [
            Text(AppLocalizations.of(context)!.price),
            Text('\$${product.price}', style: AppTextStyles.bold15),
          ],
        ),
      ],
    );
  }
}
