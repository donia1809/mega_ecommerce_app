import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class ProductListImages extends StatelessWidget {
  final ProductEntity product;

  const ProductListImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.images.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 85,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.images[index],
              width: 75,
              height: 75,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
