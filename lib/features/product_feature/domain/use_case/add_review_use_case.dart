import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/add_review_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/repo/add_review_repo.dart';

class AddReviewParams {
  final double rating;
  final String comment;

  AddReviewParams({required this.rating, required this.comment});

  Map<String, dynamic> get toMap {
    return {'rating': rating, 'comment': comment};
  }
}

class AddReviewUseCase {
  final AddReviewRepo addReviewRepo;

  AddReviewUseCase({required this.addReviewRepo});

  Future<Either<Failure, AddReviewEntity>> call(
    AddReviewParams params,
    String productId,
  ) {
    return addReviewRepo.addReview(params, productId);
  }
}
