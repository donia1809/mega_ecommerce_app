import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/data_source/add_review_data_source.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/add_review_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/repo/add_review_repo.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/add_review_use_case.dart';

class AddReviewRepoImpl implements AddReviewRepo {
  final AddReviewDataSource addReviewDataSource;

  AddReviewRepoImpl({required this.addReviewDataSource});
  @override
  Future<Either<Failure, AddReviewEntity>> addReview(
    AddReviewParams params,
    String productId,
  ) async {
    try {
      final result = await addReviewDataSource.addReview(params, productId);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
