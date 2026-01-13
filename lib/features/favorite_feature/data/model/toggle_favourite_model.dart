import 'package:mega_ecommerce_app/features/favorite_feature/domain/entity/toggle_favorite_entity.dart';

class ToggleFavoriteModel extends ToggleFavoriteEntity {
  const ToggleFavoriteModel({
    required super.message,
  });

  factory ToggleFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ToggleFavoriteModel(
      message: json['message'] ?? '',
    );
  }

}
