import 'package:flutter/widgets.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductDescriptionWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.description,
          style: AppTextStyles.bold15,
        ),
        SizedBox(height: 8),
        Text(
          product.description,
          style: AppTextStyles.regular15,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }
}
