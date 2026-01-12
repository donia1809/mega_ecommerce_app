import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/add_review_model.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/add_review_use_case.dart';

abstract class AddReviewDataSource {
  Future<AddReviewModel> addReview(AddReviewParams params, String id);
}

class AddReviewDataSourceImpl implements AddReviewDataSource {
  final ApiHelper apiHelper;

  AddReviewDataSourceImpl({required this.apiHelper});

  @override
  Future<AddReviewModel> addReview(AddReviewParams params, String id) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/products/$id/reviews',
      body: params.toMap,
    );
    return AddReviewModel.fromJson(response);
  }
}
