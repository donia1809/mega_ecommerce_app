import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/product_model.dart';

abstract class OwnerRemoteDataSource {
  Future<List<ProductModel>> getOwnerProduct();
}

class OwnerRemoteDataSourceImpl implements OwnerRemoteDataSource {
  final ApiHelper apiHelper;

  OwnerRemoteDataSourceImpl({required this.apiHelper});
  @override
  Future<List<ProductModel>> getOwnerProduct() async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/products/myproducts',
    );
    final List dataJson = response['data'] ?? [];
    final List<ProductModel> products =
        dataJson.map((e) {
          return ProductModel.fromJson(e);
        }).toList();

    return products;
  }
}
