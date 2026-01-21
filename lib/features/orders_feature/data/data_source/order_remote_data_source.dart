import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/models/check_out_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/models/my_order_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/models/order_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_my_orders_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_order_details_use_case.dart';

abstract class OrderRemoteDataSource {
  Future<CheckOutModel> checkOut();
  Future<MyOrdersModel> getMyOrder(OrdersParams params);
  Future<OrderModel> getOrderDetails(OrdersDetailsParams params);

}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiHelper apiHelper;

  OrderRemoteDataSourceImpl({required this.apiHelper});
  @override
  Future<CheckOutModel> checkOut() async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/orders/checkout',
    );
    return CheckOutModel.fromJson(response);
  }

  @override
  Future<MyOrdersModel> getMyOrder(OrdersParams params) async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/orders/myorders',
      queryParameters: params.toMap,
    );
    return MyOrdersModel.fromJson(response);
  }
  
  @override
  Future<OrderModel> getOrderDetails(OrdersDetailsParams params) async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/orders/${params.id}',
    );
    return OrderModel.fromJson(response);
  }
}
