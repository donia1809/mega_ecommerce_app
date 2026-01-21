import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_item_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/status_enum.dart';

class OrderEntity extends Equatable {
  final OrderUserEntity user;
  final List<OrderItemEntity> orderItems;
  final double itemsPrice;
  final double taxPrice;
  final double shippingPrice;
  final double totalPrice;
  final bool isPaid;
  final bool isDelivered;
  final OrderStatusEnum status;
  final String id;

  const OrderEntity({
    required this.user,
    required this.orderItems,
    required this.itemsPrice,
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalPrice,
    required this.isPaid,
    required this.isDelivered,
    required this.status,
    required this.id,
  });

  @override
  List<Object?> get props => [
    user,
    orderItems,
    itemsPrice,
    taxPrice,
    shippingPrice,
    totalPrice,
    isPaid,
    isDelivered,
    status,
    id,
  ];
}

class OrderUserEntity extends Equatable {
  final String id;
  final String name;
  final String email;

  const OrderUserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
