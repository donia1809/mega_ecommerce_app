import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/add_review_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/add_review_use_case.dart';

abstract class AddReviewRepo {
  Future<Either<Failure, AddReviewEntity>> addReview(
    AddReviewParams params,
    String productId,
  );
}
