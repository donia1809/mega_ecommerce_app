import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class ProductReviewWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductReviewWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: product.reviews.length,
      itemBuilder: (context, index) {
        final review = product.reviews[index];
        return SizedBox(
          child: Column(
            children: [
              Row(
                children: [Text(review.name), Text(review.rating.toString())],
              ),
              Text(
                review.comment,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        );
      },
    );
  }
}
