import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/create_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/update_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/product_model.dart';

abstract class OwnerRemoteDataSource {
  Future<List<ProductModel>> getOwnerProduct();
  Future<ProductModel> updateOwnerProduct(UpdateOwnerProductParams params);
  Future<ProductModel> createProduct(CreateProductParams params);
  Future<ProductModel> deleteProduct(String id);
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

  @override
  Future<ProductModel> updateOwnerProduct(
    UpdateOwnerProductParams params,
  ) async {
    final response = await apiHelper.putRequest(
      endPoint: '/api/products/${params.id}',
      body: params.toMap,
    );
    return ProductModel.fromJson(response);
  }

  @override
  Future<ProductModel> createProduct(CreateProductParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/products',
      body: params.toMap,
    );
    return ProductModel.fromJson(response);
  }

  @override
  Future<ProductModel> deleteProduct(String id) async {
    final response = await apiHelper.deleteRequest(
      endPoint: '/api/products/$id',
    );
    return ProductModel.fromJson(response);
  }
}
