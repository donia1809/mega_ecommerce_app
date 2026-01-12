import 'package:mega_ecommerce_app/features/product_feature/domain/entities/add_review_entity.dart';

class AddReviewModel extends AddReviewEntity {
  const AddReviewModel({required super.message});

  factory AddReviewModel.fromJson(Map<String, dynamic> json) {
    return AddReviewModel(message: json['message']);
  }
}
