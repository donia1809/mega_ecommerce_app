import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/model/toggle_favourite_model.dart';

abstract class ToggleFavouriteDataSource {
  Future<ToggleFavoriteModel> toggleFavourite(String id);
}

class ToggleFavouriteDataSourceImpl extends ToggleFavouriteDataSource {
  final ApiHelper apiHelper;

  ToggleFavouriteDataSourceImpl({required this.apiHelper});
  @override
  Future<ToggleFavoriteModel> toggleFavourite(String id) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/products/$id/favorite',
    );
    return ToggleFavoriteModel.fromJson(response);
  }
}
