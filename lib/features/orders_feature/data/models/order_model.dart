import 'package:mega_ecommerce_app/features/orders_feature/data/models/order_item_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/status_enum.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.user,
    required super.orderItems,
    required super.itemsPrice,
    required super.taxPrice,
    required super.shippingPrice,
    required super.totalPrice,
    required super.isPaid,
    required super.isDelivered,
    required super.status,
    required super.id,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    return OrderModel(
      user: OrderUserModel.fromJson(
        userJson is Map<String, dynamic> ? userJson : {},
      ),
      orderItems:
          List.from(
            json['orderItems'] ?? [],
          ).map((e) => OrderItemModel.fromJson(e)).toList(),
      itemsPrice: (json['itemsPrice'] as num).toDouble(),
      taxPrice: (json['taxPrice'] as num).toDouble(),
      shippingPrice: (json['shippingPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      isPaid: json['isPaid'] ?? false,
      isDelivered: json['isDelivered'] ?? false,
      status: OrderStatusEnum.fromString(json['status']),
      id: json['_id'],
    );
  }
}

class OrderUserModel extends OrderUserEntity {
  const OrderUserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory OrderUserModel.fromJson(Map<String, dynamic> json) {
    return OrderUserModel(
      id: json['_id'] ??'',
      name: json['name']??'',
      email: json['email']??'',
    );
  }
}
