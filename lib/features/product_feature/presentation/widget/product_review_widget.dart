import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(review.userImage),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    review.userName,
                    style: AppTextStyles.medium15,
                  ),
                  Spacer(),
                  Text(
                    review.rating.toString(),
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                review.comment,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
               SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
