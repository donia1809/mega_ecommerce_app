import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/data/model/toggle_favourite_model.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/product_model.dart';

abstract class FavoriteDataSource {
  Future<ToggleFavoriteModel> toggleFavourite(String id);
  Future<List<ProductModel>> getFavorite();
}

class FavoriteDataSourceImpl extends FavoriteDataSource {
  final ApiHelper apiHelper;

  FavoriteDataSourceImpl({required this.apiHelper});
  @override
  Future<ToggleFavoriteModel> toggleFavourite(String id) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/products/$id/favorite',
    );

    return ToggleFavoriteModel.fromJson(response);
  }

  @override
  Future<List<ProductModel>> getFavorite() async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/products/favorites',
    );
    final List dataJson = response['data'] ?? [];
    final List<ProductModel> products =
        dataJson.map((e) {
          return ProductModel.fromJson(e);
        }).toList();

    return products;
  }
}
