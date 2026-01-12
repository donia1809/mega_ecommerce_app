import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class ProductImageWidget extends StatelessWidget {
  final ProductsEntity product;

  const ProductImageWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 16),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/favourite.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
