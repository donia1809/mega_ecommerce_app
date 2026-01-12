import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/product_model.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/product_pagination_model.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';

abstract class ProductRemoteDataSource {
  Future<ProductsPaginationModel> getProducts(ProductParams params);
  Future<ProductModel> getProductById(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiHelper apiHelper;

  ProductRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<ProductsPaginationModel> getProducts(ProductParams params) async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/products',
      queryParameters: params.toMap..removeWhere((key, value) => value == null),
    );
    return ProductsPaginationModel.fromJson(response);
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await apiHelper.getRequest(endPoint: '/api/products/$id');
    return ProductModel.fromJson(response);
  }

}
