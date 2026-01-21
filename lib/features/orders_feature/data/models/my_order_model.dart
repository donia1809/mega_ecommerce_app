import 'package:mega_ecommerce_app/features/orders_feature/data/models/order_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/my_order_emtity.dart';

class MyOrdersModel extends MyOrdersEntity {
  const MyOrdersModel({
    required super.orders,
    required super.page,
    required super.pages,
    required super.total,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) {
    return MyOrdersModel(
      orders: List.from(json['orders'] ??[])
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      page: json['page'],
      pages: json['pages'],
      total: json['total'],
    );
  }
}
