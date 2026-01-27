import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/cart_feature/data/model/cart_model.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/update_quantity_use_case.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<CartModel> addToCart(AddProductToCartParams params);
  Future<CartModel> removeFromCart(String id);

  Future<CartModel> updateQuantity(UpdateQuantityParams params);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiHelper apiHelper;

  CartRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<CartModel> getCart() async {
    final response = await apiHelper.getRequest(endPoint: '/api/cart');
    return CartModel.fromJson(response);
  }

  @override
  Future<CartModel> addToCart(AddProductToCartParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/cart',
      body: params.toMap,
    );
    return CartModel.fromJson(response);
  }

  @override
  Future<CartModel> removeFromCart(String id) async {
    final response = await apiHelper.deleteRequest(endPoint: '/api/cart/$id');
    return CartModel.fromJson(response);
  }


  @override
  Future<CartModel> updateQuantity(UpdateQuantityParams params) async {
    final response = await apiHelper.putRequest(
      endPoint: '/api/cart/${params.productId}',
      body: params.toMap
    );
    return CartModel.fromJson(response);
  }
}
